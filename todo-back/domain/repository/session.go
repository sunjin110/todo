package repository

import (
	"context"
	"errors"
	"todo-back/domain/model"
)

var (
	ErrorExpireTimeIsRequired = errors.New("expire time is required")
)

type Session interface {
	// Insert err: ErrorExpireTimeIsRequired, other
	Insert(ctx context.Context, session model.Session, userID model.UserID) error
	Delete(ctx context.Context, session model.Session) error
	Get(ctx context.Context, sessionID string) (model.UserID, error)
}
