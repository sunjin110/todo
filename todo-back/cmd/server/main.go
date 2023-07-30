package main

import (
	"context"
	"time"
	common_log "todo-back/domain/common/log"
	"todo-back/infrastructure/common/log"
	"todo-back/infrastructure/handler/grpc"

	"github.com/pkg/errors"
)

func init() {
	common_log.SetGlobalManager(log.NewManager())

	if err := log.Setup(log.Debug); err != nil {
		panic(err)
	}
}

func main() {
	ctx := log.ContextWithLogger(context.Background(), "main thread")
	logger := common_log.GetLogger(ctx)
	logger.Error().Stack().Err(errors.New("")).Msg("Hello World")
	if err := grpc.Serve(ctx, grpc.ServeConfig{
		Addr:              ":3010",
		MaxConnectionAge:  3 * time.Minute,
		MaxConnectionIdle: 3 * time.Minute,
	}); err != nil {
		logger.Error().Err(err).Send()
	}
}
