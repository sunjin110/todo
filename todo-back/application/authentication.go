package application

import (
	"context"
	"fmt"
	"todo-back/domain/model"
	"todo-back/domain/repository"
	"todo-back/domain/service"
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
	passwordHashService service.PasswordHash
	sessionService      service.SessionService
	userRepository      repository.User
}

func NewAuthentication(passwordHashService service.PasswordHash, sessionService service.SessionService, userRepository repository.User) Authentication {
	return &authentication{
		passwordHashService: passwordHashService,
		sessionService:      sessionService,
		userRepository:      userRepository,
	}
}

func (a *authentication) SignUp(ctx context.Context, input *SignUpInput) (output *SignUpOutput, err error) {
	panic("todo")
}

func (a *authentication) SignIn(ctx context.Context, input *SignInInput) (output *SignInOutput, err error) {
	user, err := a.userRepository.GetByEmail(ctx, input.Email)
	if err != nil {
		if err == repository.ErrNotFound {
			return nil, ErrorNotFound
		}
		return nil, fmt.Errorf("failed get user. email: %s, err: %w", input.Email, err)
	}

	if a.passwordHashService.CreateHash(input.Password) != user.PasswordHash {
		return nil, ErrorPasswordNotMatch
	}

	session, err := a.sessionService.GenerateSignedSession()
	if err != nil {
		return nil, fmt.Errorf("failed generate signed session. userId: %s, err: %w", user.ID.String(), err)
	}

	expireTime, err := a.sessionService.GetSessionExpireTime(ctx)
	if err != nil {
		return nil, fmt.Errorf("failed get expireTime. userId: %s, err: %w", user.ID.String(), err)
	}

	// KV storeに入れる

	return &SignInOutput{
		Session: model.Session{
			Session:    session,
			ExpireTime: &expireTime,
		},
	}, nil
}

func (a *authentication) SignOut(ctx context.Context, input *SignOutInput) (err error) {
	panic("todo")
}
