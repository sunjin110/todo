package main

import (
	"context"
	"fmt"
	"strconv"
	"time"
	common_log "todo-back/domain/common/log"
	"todo-back/infrastructure/common/log"
	"todo-back/infrastructure/config"
	"todo-back/infrastructure/handler/grpc"

	env "github.com/Netflix/go-env"
)

type Environment struct {
	Addr                       string `env:"TODO_SERVER_ADDRESS"`
	MaxConnectionAge           string `env:"TODO_SERVER_MAX_CONNECTION_AGE"`  // seconds
	MaxConnectionIdle          string `env:"TODO_SERVER_MAX_CONNECTION_IDLE"` // seconds
	PasswordHashSecret         string `env:"TODO_PASSWORD_HASH_SECRET"`
	MongoDBURI                 string `env:"TODO_MONGO_DB_URI"`
	MongoDBName                string `env:"TODO_MONGO_DB_NAME"`
	CloudflareAccountID        string `env:"TODO_CLOUDFLARE_ACCOUNT_ID"`
	SessionSecretKey           string `env:"TODO_SESSION_SECRET_KEY"`
	SessionDuration            string `env:"TODO_SESSION_DURATION"` // minutes
	SessionNamespaceIdentifier string `env:"TODO_SESSION_NAMESPACE_IDENTIFIER"`
	SessionKVAccessToken       string `env:"TODO_SESSION_KV_ACCESS_TOKEN"`
}

func (e *Environment) MarshalLogObject(marshaler common_log.Event) {
	marshaler.Str("MongoDBURI", e.MongoDBURI)
}

func (e *Environment) ToConfig() (*config.Config, error) {

	maxConnectionAge, err := strconv.Atoi(e.MaxConnectionAge)
	if err != nil {
		return nil, fmt.Errorf("failed atoi maxConnectionAge: err: %w", err)
	}

	maxConnectionIdle, err := strconv.Atoi(e.MaxConnectionIdle)
	if err != nil {
		return nil, fmt.Errorf("failed atoi maxConnectionIdle: err: %w", err)
	}

	sessionDuration, err := strconv.Atoi(e.SessionDuration)
	if err != nil {
		return nil, fmt.Errorf("failed atoi sessionDuration, err: %w", err)
	}

	return &config.Config{
		Server: config.ServeConfig{
			Addr:              e.Addr,
			MaxConnectionAge:  time.Duration(maxConnectionAge) * time.Second,
			MaxConnectionIdle: time.Duration(maxConnectionIdle) * time.Second,
		},
		PasswordHashSecret: e.PasswordHashSecret,
		Session: config.SessionConfig{
			SessionSecretKey:    e.SessionSecretKey,
			SessionDuration:     time.Duration(sessionDuration) * time.Minute,
			CloudFlareApiToken:  e.SessionKVAccessToken,
			CloudFlareAccountID: e.CloudflareAccountID,
			NamespaceID:         e.SessionNamespaceIdentifier,
		},
		MongoDB: config.MongoDB{
			URI: e.MongoDBURI,
			DB:  e.MongoDBName,
		},
	}, nil
}

func loadEnv() (*Environment, error) {
	environment := &Environment{}
	if _, err := env.UnmarshalFromEnviron(environment); err != nil {
		return nil, fmt.Errorf("failed unmarshal environ. err: %w", err)
	}
	return environment, nil
}

func init() {
	common_log.SetGlobalManager(log.NewManager())
	if err := log.Setup(log.Debug); err != nil {
		panic(err)
	}
}

func main() {
	ctx := log.ContextWithLogger(context.Background(), "main thread")
	logger := common_log.GetLogger(ctx)

	environment, err := loadEnv()
	if err != nil {
		logger.Error().Err(err).Send()
		return
	}

	logger.Debug().Object("env", environment).Send()

	cfg, err := environment.ToConfig()
	if err != nil {
		logger.Error().Err(err).Send()
		return
	}

	if err := grpc.Serve(ctx, cfg); err != nil {
		logger.Error().Err(err).Send()
	}
}
