package repository

import "todo-back/domain/model"

type Session interface {
	Insert(session model.Session, userID model.UserID) error
	Delete(session model.Session) error
	Get(sessionID string) (model.UserID, error)
}
