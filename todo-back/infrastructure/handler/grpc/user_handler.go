package grpc

import "todo-back/infrastructure/handler/grpc/proto_go_gen/user"

type userRpcServer struct {
	user.UnimplementedUserRpcServer
}

func NewUserRpcServer() user.UserRpcServer {
	return &userRpcServer{}
}
