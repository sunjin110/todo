package grpc

import (
	"context"
	"todo-back/infrastructure/handler/grpc/proto_go_gen/user"
)

type userRpcServer struct {
	user.UnimplementedUserRpcServer
}

func NewUserRpcServer() user.UserRpcServer {
	return &userRpcServer{}
}

func (rpc *userRpcServer) Create(context.Context, *user.CreateInput) (*user.CreateOutput, error) {

	panic("not implemented yet")
}
func (rpc *userRpcServer) Update(context.Context, *user.UpdateInput) (*user.UpdateOutput, error) {

	panic("not implemented yet")
}
func (rpc *userRpcServer) Delete(context.Context, *user.DeleteInput) (*user.DeleteOutput, error) {

	panic("not implemented yet")
}
func (rpc *userRpcServer) Get(context.Context, *user.GetInput) (*user.GetOutput, error) {

	panic("not implemented yet")
}
func (rpc *userRpcServer) List(context.Context, *user.ListInput) (*user.ListOutput, error) {

	panic("not implemented yet")
}
