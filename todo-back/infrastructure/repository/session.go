package repository

import (
	"context"
	"encoding/json"
	"fmt"
	"todo-back/domain/common/txtime"
	"todo-back/domain/model"
	"todo-back/domain/repository"
	"todo-back/infrastructure/cloudflare"
	"todo-back/infrastructure/repository/dto"
)

type session struct {
	workersKVClient cloudflare.WorkersKVClient
	namespaceID     string
}

func NewSession(workersKVClient cloudflare.WorkersKVClient, namespaceID string) repository.Session {
	return &session{
		workersKVClient: workersKVClient,
		namespaceID:     namespaceID,
	}
}

func (s *session) Insert(ctx context.Context, session model.Session, userID model.UserID) error {
	if session.ExpireTime == nil {
		return repository.ErrorExpireTimeIsRequired
	}

	sessionValue := &dto.SessionValue{
		ExpireTime: session.ExpireTime.Unix(),
		UserID:     userID.String(),
	}
	sessionValueByte, err := json.Marshal(sessionValue)
	if err != nil {
		return fmt.Errorf("failed insert session, json marshal. err: %w", err)
	}

	err = s.workersKVClient.InsertWithTTL(ctx, *session.ExpireTime, s.namespaceID, session.Session, string(sessionValueByte))
	if err != nil {
		return fmt.Errorf("failed insert session. err: %w", err)
	}
	return nil
}
func (s *session) Delete(ctx context.Context, session model.Session) error {
	err := s.workersKVClient.Delete(ctx, s.namespaceID, session.Session)
	if err != nil {
		return fmt.Errorf("failed delete session. sessionID: %s, err: %s", session.Session, err)
	}
	return nil
}
func (s *session) Get(ctx context.Context, sessionID string) (model.UserID, error) {
	got, err := s.workersKVClient.Get(ctx, s.namespaceID, sessionID)
	if err != nil {
		if err == cloudflare.ErrorWorkersKVNotFoundError {
			return "", repository.ErrNotFound
		}
		return "", fmt.Errorf("failed get session. sessionID: %s, err: %s", sessionID, err)
	}

	sessionValue := &dto.SessionValue{}
	err = json.Unmarshal(got, sessionValue)
	if err != nil {
		return "", fmt.Errorf("failed get session. json unmarshal. got: %s, err: %w", string(got), err)
	}

	txTime := txtime.GetTxTime(ctx)
	if txTime.Unix() > sessionValue.ExpireTime {
		// すでに有効期限は切れている
		s.Delete(ctx, model.Session{
			Session: sessionID,
		})
		return "", repository.ErrNotFound
	}
	return model.UserID(sessionValue.UserID), nil
}
