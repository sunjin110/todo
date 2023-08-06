package infrastructure

import (
	"todo-back/domain/model"
	"todo-back/domain/repository"
	"todo-back/infrastructure/cloudflare"
)

type session struct {
	workersKVClient cloudflare.WorkersKVClient
}

func NewSession(cloudflareApiToken string, workersKVClient cloudflare.WorkersKVClient) repository.Session {
	return &session{
		workersKVClient: workersKVClient,
	}
}

func (s *session) Insert(session model.Session, userID model.UserID) error {

	panic("todo")
}
func (s *session) Delete(session model.Session) error {

	panic("todo")
}
func (s *session) Get(sessionID string) (model.UserID, error) {

	panic("todo")
}
