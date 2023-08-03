package application

import (
	"context"
	"todo-back/domain/model"
)

type Authentication interface {
	SignUp(ctx context.Context, input SignUpInput) (output SignUpOutput, err error)
	SignIn(ctx context.Context, input SignInInput) (output SignInOutput, err error)
	SignOut(ctx context.Context, input SignOutInput) (err error)
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
	Name  string
	Email string
}

type SignInOutput struct {
	Session model.Session
}

type SignOutInput struct {
	Session model.Session
}
