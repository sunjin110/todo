package grpc

import (
	"context"
	"todo-back/application"
	"todo-back/infrastructure/handler/grpc/proto_go_gen/user"
)

type userRpcServer struct {
	user.UnimplementedUserRpcServer
	userApplication application.User
}

func NewUserRpcServer(userApplication application.User) user.UserRpcServer {
	return &userRpcServer{
		userApplication: userApplication,
	}
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
