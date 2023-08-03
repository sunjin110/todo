package grpc

import (
	"context"
	"fmt"
	"net"
	"time"
	"todo-back/domain/common/log"
	"todo-back/infrastructure/handler/grpc/proto_go_gen/alive"
	"todo-back/infrastructure/handler/grpc/proto_go_gen/todo"
	"todo-back/infrastructure/handler/grpc/proto_go_gen/user"

	"google.golang.org/grpc"
	"google.golang.org/grpc/keepalive"
)

type ServeConfig struct {
	Addr              string
	MaxConnectionAge  time.Duration
	MaxConnectionIdle time.Duration
}

func (serverConfig *ServeConfig) MarshalLogObject(event log.Event) {
	event.
		Str("Addr", serverConfig.Addr).
		Duration("MaxConnectionAge", serverConfig.MaxConnectionAge).
		Duration("MaxConnectionIdle", serverConfig.MaxConnectionIdle)
}

func Serve(ctx context.Context, config ServeConfig) error {
	logger := log.GetLogger(ctx)

	listener, err := net.Listen("tcp", config.Addr)
	if err != nil {
		return fmt.Errorf("failed listen. err: %w", err)
	}
	server := grpc.NewServer(
		grpc.KeepaliveParams(
			keepalive.ServerParameters{
				MaxConnectionIdle: config.MaxConnectionIdle,
				MaxConnectionAge:  config.MaxConnectionAge,
			},
		),
		grpc.UnaryInterceptor(logInterceptor),
		grpc.UnaryInterceptor(txTimeInterceptor),
	)

	if err := Routing(server); err != nil {
		return fmt.Errorf("failed routing. err: %w", err)
	}
	logger.Info().Object("config", &config).Msg("server start")
	if err := server.Serve(listener); err != nil {
		return fmt.Errorf("failed serve grpc server. err: %w", err)
	}
	return nil
}

func Routing(server *grpc.Server) error {
	user.RegisterUserRpcServer(server, NewUserRpcServer())
	todo.RegisterTodoRpcServer(server, NewTodoRpcServer())
	alive.RegisterAliveServer(server, NewAliveRpcServer())
	return nil
}
