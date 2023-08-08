package application

import (
	"context"
	"todo-back/application/input"
	"todo-back/application/output"
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
	userRepository repository.User
	sessionService service.SessionService
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
	panic("todo")
}

func (u *user) Create(ctx context.Context, input input.CreateUser) error {
	panic("todo")
}

func (u *user) Update(ctx context.Context, input input.UpdateUser) error {
	panic("todo")
}

func (u *user) Delete(ctx context.Context, input input.DeleteUser) error {
	panic("todo")
}
