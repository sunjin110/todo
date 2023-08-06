package grpc

import (
	"context"
	"todo-back/application"
	"todo-back/infrastructure/handler/grpc/proto_go_gen/todo"
)

type todoRpcServer struct {
	todo.UnimplementedTodoRpcServer
	userApplication application.User
}

func NewTodoRpcServer(userApplication application.User) todo.TodoRpcServer {
	return &todoRpcServer{
		userApplication: userApplication,
	}
}

func (rpc *todoRpcServer) List(context.Context, *todo.ListInput) (*todo.ListOutput, error) {
	panic("not implemented yet")
}
func (rpc *todoRpcServer) Get(context.Context, *todo.GetInput) (*todo.GetOutput, error) {
	panic("not implemented yet")
}
func (rpc *todoRpcServer) Create(context.Context, *todo.CreateInput) (*todo.CreateOutput, error) {
	panic("not implemented yet")
}
func (rpc *todoRpcServer) Update(context.Context, *todo.UpdateInput) (*todo.UpdateOutput, error) {
	panic("not implemented yet")
}
func (rpc *todoRpcServer) Delete(context.Context, *todo.DeleteInput) (*todo.DeleteOutput, error) {
	panic("not implemented yet")
}
