package model

import (
	"time"
	"todo-back/domain/common/primary"
)

type UserID string

func (u UserID) String() string {
	return string(u)
}

func NewUserID() UserID {
	return UserID(primary.ID())
}

type User struct {
	ID           UserID
	Name         string
	Email        string
	PasswordHash string
	SignUpStatus UserSignUpStatus
	CreateTime   time.Time
	LastLogin    *time.Time
}
