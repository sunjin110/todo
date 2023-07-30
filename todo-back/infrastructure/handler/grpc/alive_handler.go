package grpc

import (
	"context"
	"todo-back/domain/common/log"
	"todo-back/infrastructure/handler/grpc/proto_go_gen/alive"
	"todo-back/infrastructure/handler/grpc/proto_go_gen/common"
)

type aliveRpcServer struct {
	alive.UnimplementedAliveServer
}

func NewAliveRpcServer() alive.AliveServer {
	return &aliveRpcServer{}
}

func (rpc *aliveRpcServer) Ping(ctx context.Context, _ *common.Empty) (*common.Empty, error) {
	logger := log.GetLogger(ctx)
	logger.Info().Msg("ping ok!")
	return &common.Empty{}, nil
}
