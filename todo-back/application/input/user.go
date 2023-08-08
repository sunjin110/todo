package input

import (
	"todo-back/domain/model"
	"todo-back/domain/repository"
)

type UserList struct {
	Session model.Session
	Paging  *repository.Paging
	Sorting *repository.UserSort
	Filter  *repository.UserFilter
}

type GetUser struct {
	Session model.Session
	UserID  model.UserID
}

type CreateUserModel struct {
	Name     string
	Email    string
	Password string
}

type CreateUser struct {
	Session model.Session
	User    CreateUserModel
}

type UpdateUserModel struct {
	Name     *string
	Email    *string
	Password *string
}

type UpdateUser struct {
	Session model.Session
	User    UpdateUserModel
}

type DeleteUser struct {
	Session model.Session
	UserID  model.UserID
}
