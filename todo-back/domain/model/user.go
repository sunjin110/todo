package model

import "time"

type UserID string

type User struct {
	ID         string
	Name       string
	Email      string
	CreateTime time.Time
	LastLogin  *time.Time
}
