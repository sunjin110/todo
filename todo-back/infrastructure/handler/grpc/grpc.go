package grpc

import (
	"context"
	"fmt"
	"net"
	"todo-back/application"
	"todo-back/domain/common/log"
	"todo-back/domain/service"
	"todo-back/infrastructure/cloudflare"
	"todo-back/infrastructure/config"
	"todo-back/infrastructure/handler/grpc/proto_go_gen/alive"
	"todo-back/infrastructure/handler/grpc/proto_go_gen/authentication"
	"todo-back/infrastructure/handler/grpc/proto_go_gen/todo"
	"todo-back/infrastructure/handler/grpc/proto_go_gen/user"
	"todo-back/infrastructure/mongo"
	"todo-back/infrastructure/repository"
	infra_service "todo-back/infrastructure/service"

	"google.golang.org/grpc"
	"google.golang.org/grpc/keepalive"
)

func Serve(ctx context.Context, config *config.Config) error {
	logger := log.GetLogger(ctx)

	listener, err := net.Listen("tcp", config.Server.Addr)
	if err != nil {
		return fmt.Errorf("failed listen. err: %w", err)
	}
	server := grpc.NewServer(
		grpc.KeepaliveParams(
			keepalive.ServerParameters{
				MaxConnectionIdle: config.Server.MaxConnectionIdle,
				MaxConnectionAge:  config.Server.MaxConnectionAge,
			},
		),
		grpc.ChainUnaryInterceptor(logInterceptor, txTimeInterceptor),
	)

	if err := Routing(ctx, server, config); err != nil {
		return fmt.Errorf("failed routing. err: %w", err)
	}
	logger.Info().Msg("server start...")
	if err := server.Serve(listener); err != nil {
		return fmt.Errorf("failed serve grpc server. err: %w", err)
	}
	return nil
}

// ぶっちゃけここで書くアレではないがもうしんどいのでここに書く
func Routing(ctx context.Context, server *grpc.Server, config *config.Config) error {

	cloudflareWorkspaceClient, err := cloudflare.NewWorkersKVClient(config.Session.CloudFlareApiToken, config.Session.CloudFlareAccountID)
	if err != nil {
		return fmt.Errorf("failed new workers kv client, err: %w", err)
	}

	mongoClient, err := mongo.Connect(ctx, config.MongoDB.URI)
	if err != nil {
		return fmt.Errorf("failed connect mongodb, err: %w", err)
	}

	mongoDB := mongoClient.Database(config.MongoDB.DB)

	passwordHashService := service.NewPasswordHash(config.PasswordHashSecret)
	morphologicalAnalysisService, err := infra_service.NewMorphologicalAnalysis()
	if err != nil {
		return fmt.Errorf("failed new morphological analysis service. err: %w", err)
	}

	sessionRepository := repository.NewSession(cloudflareWorkspaceClient, config.Session.NamespaceID)
	userRepository := repository.NewUser(mongoDB)
	todoRepository := repository.NewTodo(mongoDB, morphologicalAnalysisService, service.JpMorphological)

	sessionService := service.NewSessionService(config.Session.SessionSecretKey,
		config.Session.SessionDuration, sessionRepository, userRepository)

	todoApplication := application.NewTodo(todoRepository, sessionService)

	authenticationApplication := application.NewAuthentication(passwordHashService, sessionService, userRepository)

	user.RegisterUserRpcServer(server, NewUserRpcServer())
	todo.RegisterTodoRpcServer(server, NewTodoRpcServer(todoApplication))
	alive.RegisterAliveServer(server, NewAliveRpcServer())
	authentication.RegisterAuthenticationServer(server, NewAuthenticationRpcService(authenticationApplication))
	return nil
}
