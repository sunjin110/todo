package application

import (
	"context"
	"fmt"
	"todo-back/application/input"
	"todo-back/application/output"
	"todo-back/domain/common/txtime"
	"todo-back/domain/model"
	"todo-back/domain/repository"
	"todo-back/domain/service"
)

type User interface {
	List(ctx context.Context, input input.UserList) (*output.ListUser, error)
	Get(ctx context.Context, input input.GetUser) (*output.GetUser, error)
	Create(ctx context.Context, input input.CreateUser) error
	Update(ctx context.Context, input input.UpdateUser) error
	Delete(ctx context.Context, input input.DeleteUser) error
}

type user struct {
	userRepository      repository.User
	sessionService      service.SessionService
	passwordHashService service.PasswordHash
}

func NewUser(userRepository repository.User, sessionService service.SessionService) User {
	return &user{
		userRepository: userRepository,
		sessionService: sessionService,
	}
}

func (u *user) List(ctx context.Context, input input.UserList) (*output.ListUser, error) {
	panic("todo")
}

func (u *user) Get(ctx context.Context, input input.GetUser) (*output.GetUser, error) {
	_, err := u.sessionService.GetAuthenticatedSession(ctx, input.Session)
	if err != nil {
		if err == service.ErrorNotFoundSession ||
			err == service.ErrorNotFoundUser {
			return nil, ErrorAuthentication
		}
	}

	user, err := u.userRepository.Get(ctx, input.UserID)
	if err != nil {
		if err == repository.ErrNotFound {
			return nil, ErrorNotFound
		}
		return nil, fmt.Errorf("failed get user. userID: %s, err: %w", input.UserID, err)
	}
	return &output.GetUser{
		User: user,
	}, nil
}

func (u *user) Create(ctx context.Context, input input.CreateUser) error {
	_, err := u.sessionService.GetAuthenticatedSession(ctx, input.Session)
	if err != nil {
		if err == service.ErrorNotFoundSession ||
			err == service.ErrorNotFoundUser {
			return ErrorAuthentication
		}
	}

	var passwordHash string
	if input.User.Password != nil {
		passwordHash = u.passwordHashService.CreateHash(*input.User.Password)
	}

	txTime := txtime.GetTxTime(ctx)

	_, err = u.userRepository.Create(ctx, model.User{
		ID:           model.NewUserID(),
		Name:         input.User.Name,
		Email:        input.User.Email,
		PasswordHash: passwordHash,
		SignUpStatus: input.User.Status,
		CreateTime:   txTime,
	})

	if err != nil {
		return fmt.Errorf("failed insert user. err: %w", err)
	}
	return nil
}

func (u *user) Update(ctx context.Context, input input.UpdateUser) error {
	_, err := u.sessionService.GetAuthenticatedSession(ctx, input.Session)
	if err != nil {
		if err == service.ErrorNotFoundSession ||
			err == service.ErrorNotFoundUser {
			return ErrorAuthentication
		}
	}

	if input.User.Email != nil {
		_, err := u.userRepository.GetByEmail(ctx, *input.User.Email)
		if err == nil || err != repository.ErrNotFound {
			return ErrorEmailAlreadyExists
		}
	}

	beforeUser, err := u.userRepository.Get(ctx, input.User.ID)
	if err != nil {
		if err == repository.ErrNotFound {
			return ErrorNotFound
		}
		return fmt.Errorf("failed get before user. userID: %s, err: %w", input.User.ID, err)
	}

	updatedUser := u.generateUpdatedUser(beforeUser, input.User)
	err = u.userRepository.Update(ctx, input.User.ID, updatedUser)
	if err != nil {
		return fmt.Errorf("failed update user. err: %w", err)
	}
	return nil
}

func (u *user) Delete(ctx context.Context, input input.DeleteUser) error {
	_, err := u.sessionService.GetAuthenticatedSession(ctx, input.Session)
	if err != nil {
		if err == service.ErrorNotFoundSession ||
			err == service.ErrorNotFoundUser {
			return ErrorAuthentication
		}
	}

	err = u.userRepository.Delete(ctx, input.UserID)
	if err != nil {
		return fmt.Errorf("failed delete user. userID: %s, err: %w", input.UserID.String(), err)
	}
	return nil
}

func (u *user) generateUpdatedUser(beforeUser model.User, updatedUser input.UpdateUserModel) model.User {
	beforeUser.Name = derefOrDefault(updatedUser.Name, beforeUser.Name)
	beforeUser.Email = derefOrDefault(updatedUser.Email, beforeUser.Email)

	if updatedUser.Password != nil {
		beforeUser.PasswordHash = u.passwordHashService.CreateHash(*updatedUser.Password)
	}
	beforeUser.SignUpStatus = derefOrDefault(updatedUser.Status, beforeUser.SignUpStatus)
	return beforeUser
}
