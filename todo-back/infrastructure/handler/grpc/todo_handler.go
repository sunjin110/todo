package grpc

import (
	"context"
	"fmt"
	"todo-back/application"
	"todo-back/infrastructure/handler/grpc/convert"
	"todo-back/infrastructure/handler/grpc/proto_go_gen/todo"
)

type todoRpcServer struct {
	todo.UnimplementedTodoRpcServer
	todoApplication application.Todo
}

func NewTodoRpcServer(todoApplication application.Todo) todo.TodoRpcServer {
	return &todoRpcServer{
		todoApplication: todoApplication,
	}
}

func (rpc *todoRpcServer) List(context.Context, *todo.ListInput) (*todo.ListOutput, error) {
	panic("not implemented yet")
}
func (rpc *todoRpcServer) Get(ctx context.Context, in *todo.GetInput) (*todo.GetOutput, error) {
	output, err := rpc.todoApplication.Get(ctx, *convert.ToModelGetTodoInput(in))
	if err != nil {
		return nil, fmt.Errorf("failed todo get. err: %w", err)
	}

	panic("todo")

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
