package application

import (
	"context"
	"fmt"
	"todo-back/domain/common/txtime"
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

	// すでに存在するかどうかを確認
	user, err := a.userRepository.GetByEmail(ctx, input.Email)
	if err != nil && err != repository.ErrNotFound {
		return nil, fmt.Errorf("failed get user. email: %s, err: %w", input.Email, err)
	}

	txTime := txtime.GetTxTime(ctx)

	if err == repository.ErrNotFound {
		passwordHash := a.passwordHashService.CreateHash(input.Password)

		// 仮登録状態にする
		_, err = a.userRepository.Create(ctx, model.User{
			ID:           model.NewUserID(),
			Name:         input.Name,
			Email:        input.Email,
			PasswordHash: passwordHash,
			SignUpStatus: model.SignUpWaitForAllow,
			CreateTime:   txTime,
		})
		if err != nil {
			return nil, fmt.Errorf("failed insert user. err: %w", err)
		}
		return &SignUpOutput{
			Session: nil,
			Status:  model.SignUpWaitForAllow,
		}, nil
	}

	if user.SignUpStatus == model.SignUpDenied {
		return &SignUpOutput{
			Session: nil,
			Status:  model.SignUpDenied,
		}, nil
	}

	if user.SignUpStatus == model.SignUpAllowed {
		if user.PasswordHash != a.passwordHashService.CreateHash(input.Password) {
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

		err = a.sessionService.StartSession(ctx, user, model.Session{
			Session:    session,
			ExpireTime: &expireTime,
		})
		if err != nil {
			return nil, fmt.Errorf("failed start session. userId: %s, err: %w", user.ID.String(), err)
		}

		return &SignUpOutput{
			Session: &model.Session{
				Session:    session,
				ExpireTime: &expireTime,
			},
			Status: model.SignUpAllowed,
		}, nil
	}
	return nil, fmt.Errorf("not defined status type. userId: %s, status: %s", user.ID.String(), user.SignUpStatus)
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

	err = a.sessionService.StartSession(ctx, user, model.Session{
		Session:    session,
		ExpireTime: &expireTime,
	})
	if err != nil {
		return nil, fmt.Errorf("failed start session. userId: %s, err: %w", user.ID.String(), err)
	}

	return &SignInOutput{
		Session: model.Session{
			Session:    session,
			ExpireTime: &expireTime,
		},
	}, nil
}

func (a *authentication) SignOut(ctx context.Context, input *SignOutInput) error {
	err := a.sessionService.DeleteSession(ctx, model.Session{
		Session: input.Session.Session,
	})
	if err != nil {
		return fmt.Errorf("failed sign out, sessionID: %s, err: %w", input.Session.Session, err)
	}
	return nil
}
