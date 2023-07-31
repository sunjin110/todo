package grpc

import (
	"context"
	"fmt"
	"todo-back/domain/common/log"
	zerolog "todo-back/infrastructure/common/log"

	"github.com/google/uuid"
	"google.golang.org/grpc"
)

func logInterceptor(ctx context.Context, req interface{}, info *grpc.UnaryServerInfo, handler grpc.UnaryHandler) (interface{}, error) {
	u, _ := uuid.NewRandom()
	ctx = zerolog.ContextWithLogger(ctx, u.String())

	logger := log.GetLogger(ctx)
	logger.Info().Str("path", info.FullMethod).Str("req", fmt.Sprintf("%+v", req)).Send()
	res, err := handler(ctx, req)
	if err != nil {
		logger.Error().Err(err).Send()
	}
	return res, err
}