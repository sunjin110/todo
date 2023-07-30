package main

import (
	"context"
	"fmt"
	"time"
	common_log "todo-back/domain/common/log"
	"todo-back/infrastructure/common/log"
	"todo-back/infrastructure/handler/grpc"
	"todo-back/infrastructure/mongo"

	env "github.com/Netflix/go-env"
)

type Environment struct {
	MongoDBURI string `env:"MONGO_DB_URI"`
}

func (e *Environment) MarshalLogObject(marshaler common_log.Event) {
	marshaler.Str("MongoDBURI", e.MongoDBURI)
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

	mongoClient, err := mongo.Connect(ctx, environment.MongoDBURI)
	if err != nil {
		logger.Error().Err(err).Send()
		return
	}

	// TODO
	mongoClient.Database("")

	if err := grpc.Serve(ctx, grpc.ServeConfig{
		Addr:              ":3010",
		MaxConnectionAge:  3 * time.Minute,
		MaxConnectionIdle: 3 * time.Minute,
	}); err != nil {
		logger.Error().Err(err).Send()
	}
}
