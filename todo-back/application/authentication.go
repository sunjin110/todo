package application

import (
	"context"
	"todo-back/domain/model"
)

type Authentication interface {
	SignUp(ctx context.Context, input *SignUpInput) (output *SignUpOutput, err error)
	SignIn(ctx context.Context, input *SignInInput) (output *SignInOutput, err error)
	SignOut(ctx context.Context, input *SignOutInput) (err error)
}

type SignUpInput struct {
	Name     string
	Email    string
	Password string
}

type SignUpOutput struct {
	Session *model.Session
	Status  model.UserSignUpStatus
}

type SignInInput struct {
	Email    string
	Password string
}

type SignInOutput struct {
	Session model.Session
}

type SignOutInput struct {
	Session model.Session
}

type authentication struct {
}

func NewAuthentication() Authentication {
	return &authentication{}
}

func (a *authentication) SignUp(ctx context.Context, input *SignUpInput) (output *SignUpOutput, err error) {
	panic("todo")
}

func (a *authentication) SignIn(ctx context.Context, input *SignInInput) (output *SignInOutput, err error) {
	panic("todo")
}

func (a *authentication) SignOut(ctx context.Context, input *SignOutInput) (err error) {
	panic("todo")
}
