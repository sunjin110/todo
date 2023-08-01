package model

import "time"

type UserID string

func (u UserID) String() string {
	return string(u)
}

type User struct {
	ID         UserID
	Name       string
	Email      string
	CreateTime time.Time
	LastLogin  *time.Time
}
