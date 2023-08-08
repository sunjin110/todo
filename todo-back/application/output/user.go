package output

import "todo-back/domain/model"

type GetUser struct {
	User model.User
}

type ListUser struct {
	Users   []model.User
	HasNext bool
}
