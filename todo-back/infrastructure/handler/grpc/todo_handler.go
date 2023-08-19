package grpc

import (
	"context"
	"fmt"
	"todo-back/application"
	"todo-back/infrastructure/handler"
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

func (rpc *todoRpcServer) List(ctx context.Context, list *todo.ListInput) (*todo.ListOutput, error) {
	output, err := rpc.todoApplication.List(ctx, *convert.ToModelListTodoInput(list))
	if err != nil {
		if err == application.ErrorAuthentication {
			return nil, handler.ErrAuthentication
		}

		return nil, fmt.Errorf("failed todo list, err: %w", err)
	}
	return convert.ToGrpcListTodoOutput(output), nil
}

func (rpc *todoRpcServer) Get(ctx context.Context, in *todo.GetInput) (*todo.GetOutput, error) {
	output, err := rpc.todoApplication.Get(ctx, *convert.ToModelGetTodoInput(in))
	if err != nil {
		if err == application.ErrorAuthentication {
			return nil, handler.ErrAuthentication
		}

		return nil, fmt.Errorf("failed todo get. err: %w", err)
	}

	return convert.ToGRPCGetTodoOutput(output), nil
}

func (rpc *todoRpcServer) Create(ctx context.Context, input *todo.CreateInput) (*todo.CreateOutput, error) {
	err := rpc.todoApplication.Create(ctx, *convert.ToModelCreateTodoInput(input))
	if err != nil {
		if err == application.ErrorAuthentication {
			return nil, handler.ErrAuthentication
		}
		return nil, fmt.Errorf("failed todo create. err: %w", err)
	}
	return &todo.CreateOutput{}, nil
}

func (rpc *todoRpcServer) Update(ctx context.Context, input *todo.UpdateInput) (*todo.UpdateOutput, error) {
	err := rpc.todoApplication.Update(ctx, *convert.ToModelUpdateTodoInput(input))
	if err != nil {
		if err == application.ErrorAuthentication {
			return nil, handler.ErrAuthentication
		}

		return nil, fmt.Errorf("failed todo update. err: %w", err)
	}
	return &todo.UpdateOutput{}, nil
}

func (rpc *todoRpcServer) Delete(ctx context.Context, input *todo.DeleteInput) (*todo.DeleteOutput, error) {
	err := rpc.todoApplication.Delete(ctx, *convert.ToModelDeleteTodoInput(input))
	if err != nil {
		if err == application.ErrorAuthentication {
			return nil, handler.ErrAuthentication
		}

		return nil, fmt.Errorf("failed todo delete. err: %w", err)
	}
	return &todo.DeleteOutput{}, nil
}
