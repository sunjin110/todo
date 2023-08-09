package repository

import (
	"context"
	"todo-back/domain/model"
)

type UserListRequest struct {
	Paging *Paging
	Sort   *UserSort
	Filter *UserFilter
}

type UserListOutput struct {
	List    []model.User
	HasNext bool
}

type UserSort struct {
	LastLogin  *SortField
	CreateTime *SortField
}

type UserFilter struct {
	ID    *FilterField[model.UserID]
	Name  *FilterField[string]
	Email *FilterField[string]
}

type User interface {
	Create(ctx context.Context, user model.User) (model.UserID, error)
	Update(ctx context.Context, id model.UserID, updatedUser model.User) error
	Delete(ctx context.Context, id model.UserID) error

	// Get err: ErrNotFound, other
	Get(ctx context.Context, id model.UserID) (model.User, error)

	// GetByEmail err: ErrNotFound, Other
	GetByEmail(ctx context.Context, email string) (model.User, error)
	List(ctx context.Context, request UserListRequest) (UserListOutput, error)
}
