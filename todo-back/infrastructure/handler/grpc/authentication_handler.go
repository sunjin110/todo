package grpc

import (
	"context"
	"todo-back/application"
	"todo-back/infrastructure/handler/grpc/convert"
	"todo-back/infrastructure/handler/grpc/proto_go_gen/authentication"
)

type authenticationRpcService struct {
	authentication.UnimplementedAuthenticationServer
	authenticationApplication application.Authentication
}

func NewAuthenticationRpcService(authenticationApplication application.Authentication) authentication.AuthenticationServer {
	return &authenticationRpcService{
		authenticationApplication: authenticationApplication,
	}
}

func (rpc *authenticationRpcService) SignUp(ctx context.Context, input *authentication.SignUpInput) (*authentication.SignUpOutput, error) {
	panic("todo")
}

func (rpc *authenticationRpcService) SignIn(ctx context.Context, input *authentication.SignInInput) (*authentication.SignInOutput, error) {
	output, err := rpc.authenticationApplication.SignIn(ctx, convert.ToSignInInput(input))
	if err != nil {
		return nil, err
	}
	return convert.ToGrpcSignInOutput(output), nil
}

func (rpc *authenticationRpcService) SignOut(ctx context.Context, input *authentication.SignOutInput) (*authentication.SignOutOutput, error) {
	panic("todo")
}
