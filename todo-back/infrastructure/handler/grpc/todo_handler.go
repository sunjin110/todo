package grpc

import (
	"context"
	"todo-back/infrastructure/handler/grpc/proto_go_gen/todo"
)

type todoRpcServer struct {
	todo.UnimplementedTodoRpcServer
}

func NewTodoRpcServer() todo.TodoRpcServer {
	return &todoRpcServer{}
}

func (server *todoRpcServer) List(ctx context.Context, input *todo.ListInput) (*todo.ListOutput, error) {
	panic("todo")
}

func (server *todoRpcServer) Get(ctx context.Context, input *todo.GetInput) (*todo.GetOutput, error) {
	panic("todo")
}

func (server *todoRpcServer) Create(ctx context.Context, input *todo.CreateInput) (*todo.CreateOutput, error) {
	panic("todo")
}
