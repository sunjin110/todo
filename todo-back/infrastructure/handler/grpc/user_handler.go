package grpc

import (
	"context"
	"fmt"
	"todo-back/application"
	"todo-back/infrastructure/handler/grpc/convert"
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

func (rpc *userRpcServer) Create(ctx context.Context, in *user.CreateInput) (*user.CreateOutput, error) {
	err := rpc.userApplication.Create(ctx, *convert.ToModelCreateUserInput(in))
	if err != nil {
		return nil, fmt.Errorf("failed create user. err: %w", err)
	}
	return &user.CreateOutput{}, nil
}

func (rpc *userRpcServer) Update(ctx context.Context, in *user.UpdateInput) (*user.UpdateOutput, error) {
	err := rpc.userApplication.Update(ctx, *convert.ToModelUpdateUserInput(in))
	if err != nil {
		return nil, fmt.Errorf("failed update user. err: %w", err)
	}
	return &user.UpdateOutput{}, nil
}

func (rpc *userRpcServer) Delete(ctx context.Context, in *user.DeleteInput) (*user.DeleteOutput, error) {
	err := rpc.userApplication.Delete(ctx, *convert.ToModelDeleteUserInput(in))
	if err != nil {
		return nil, fmt.Errorf("failed delete user. err: %w", err)
	}
	return &user.DeleteOutput{}, nil
}

func (rpc *userRpcServer) Get(ctx context.Context, in *user.GetInput) (*user.GetOutput, error) {
	output, err := rpc.userApplication.Get(ctx, *convert.ToModelGetUserInput(in))
	if err != nil {
		return nil, fmt.Errorf("failed get user. err: %w", err)
	}
	return convert.ToGrpcGetUserOutput(output), nil
}

func (rpc *userRpcServer) List(ctx context.Context, in *user.ListInput) (*user.ListOutput, error) {
	output, err := rpc.userApplication.List(ctx, *convert.ToModelListUserInput(in))
	if err != nil {
		return nil, fmt.Errorf("failed list user. err: %w", err)
	}
	return convert.ToGrpcListUserOutput(output), nil
}
