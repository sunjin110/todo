package repository

import (
	"context"
	"todo-back/domain/model"
)

type UserListRequest struct {
	paging *Paging
	sort   *UserSort
	filter *UserFilter
}

type UserListOutput struct {
	List    []model.User
	HasNext bool
}

type UserSort struct {
	LastLogin  *SortKind
	CreateTime *SortKind
}

type UserFilter struct {
	ID    *FilterField[model.TodoID]
	Name  *FilterField[string]
	Email *FilterField[string]
}

type User interface {
	Create(ctx context.Context, user model.User) (model.UserID, error)
	Update(ctx context.Context, id model.UserID, updatedUser model.User) error
	Delete(ctx context.Context, id model.UserID) error
	Get(ctx context.Context, id model.UserID) (model.User, error)
	List(ctx context.Context, request UserListRequest) (UserListOutput, error)
}
