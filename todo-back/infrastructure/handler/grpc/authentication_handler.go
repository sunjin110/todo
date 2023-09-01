package grpc

import (
	"context"
	"fmt"
	"todo-back/application"
	"todo-back/domain/common/log"
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
	logger := log.GetLogger(ctx)
	logger.Info().Str("Email", input.Email).Str("Name", input.Name).Msg("=============== SingUp")
	output, err := rpc.authenticationApplication.SignUp(ctx, convert.ToSignUpInput(input))
	if err != nil {
		return nil, fmt.Errorf("failed sign up, err: %w", err)
	}
	return convert.ToGrpcSignUpOutput(output), nil
}

func (rpc *authenticationRpcService) SignIn(ctx context.Context, input *authentication.SignInInput) (*authentication.SignInOutput, error) {
	output, err := rpc.authenticationApplication.SignIn(ctx, convert.ToSignInInput(input))
	if err != nil {
		return nil, fmt.Errorf("failed sign in, err: %w", err)
	}
	return convert.ToGrpcSignInOutput(output), nil
}

func (rpc *authenticationRpcService) SignOut(ctx context.Context, input *authentication.SignOutInput) (*authentication.SignOutOutput, error) {
	err := rpc.authenticationApplication.SignOut(ctx, convert.ToSignOutInput(input))
	if err != nil {
		return nil, fmt.Errorf("failed sign out, err: %w", err)
	}
	return convert.ToGrpcSignOutOutput(), nil
}
