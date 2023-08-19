package grpc

import (
	"context"
	"fmt"
	"time"
	"todo-back/domain/common/log"
	"todo-back/domain/common/txtime"
	zerolog "todo-back/infrastructure/common/log"
	"todo-back/infrastructure/handler"

	"github.com/google/uuid"
	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func logInterceptor(ctx context.Context, req interface{}, info *grpc.UnaryServerInfo, handler grpc.UnaryHandler) (interface{}, error) {
	u, _ := uuid.NewRandom()
	ctx = zerolog.ContextWithLogger(ctx, u.String())

	logger := log.GetLogger(ctx)
	logger.Info().Str("path", info.FullMethod).Str("req", fmt.Sprintf("%+v", req)).Send()
	res, err := handler(ctx, req)
	if err != nil {
		logger.Error().Interface("req", req).Str("FullMethod", info.FullMethod).Err(err).Send()
	}

	logger.Debug().Interface("res", res).Send()
	return res, err
}

func txTimeInterceptor(ctx context.Context, req interface{}, _ *grpc.UnaryServerInfo, handler grpc.UnaryHandler) (interface{}, error) {
	ctx = txtime.ContextWithTxTime(ctx, time.Now())
	return handler(ctx, req)
}

func errorHandlingInterceptor(ctx context.Context, req interface{}, _ *grpc.UnaryServerInfo, h grpc.UnaryHandler) (interface{}, error) {
	res, err := h(ctx, req)
	if err != nil {
		switch err {
		case handler.ErrAuthentication:
			st := status.New(codes.Unauthenticated, "unauthenticated")
			return nil, st.Err()
		default:
			st := status.New(codes.Internal, "internal server error")
			return nil, st.Err()
		}
	}
	return res, err
}
