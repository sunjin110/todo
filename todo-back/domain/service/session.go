package service

import (
	"context"
	"crypto/hmac"
	"crypto/rand"
	"crypto/sha256"
	"encoding/hex"
	"errors"
	"fmt"
	"time"
	"todo-back/domain/common/txtime"
	"todo-back/domain/model"
	"todo-back/domain/repository"
)

var (
	ErrorNotFoundSession = errors.New("not found session")
	ErrorNotFoundUser    = errors.New("not found user")
)

type SessionService interface {
	GenerateSignedSession() (string, error)
	VerifyAndExtract(signedString string) ([]byte, bool)
	GetSessionExpireTime(ctx context.Context) (time.Time, error)
	StartSession(ctx context.Context, user model.User, session model.Session) error

	// GetUserBySession err: ErrorNotFoundSession, ErrorNotFoundUser, other
	GetUserBySession(ctx context.Context, session model.Session) (model.User, error)

	// GetAuthenticatedSession err: ErrorNotFoundSession, ErrorNotFoundUser
	GetAuthenticatedSession(ctx context.Context, session model.Session) (model.AuthenticatedSession, error)
	DeleteSession(ctx context.Context, session model.Session) error
}

const digit = 16

type sessionService struct {
	secretKey         string
	sessionDuration   time.Duration
	sessionRepository repository.Session
	userRepository    repository.User
}

func NewSessionService(secretKey string, sessionDuration time.Duration,
	sessionRepository repository.Session, userRepository repository.User) SessionService {
	return &sessionService{
		secretKey:         secretKey,
		sessionDuration:   sessionDuration,
		sessionRepository: sessionRepository,
		userRepository:    userRepository,
	}
}

func generateRandomBytes(n int) ([]byte, error) {
	b := make([]byte, n)
	_, err := rand.Read(b)
	if err != nil {
		return nil, fmt.Errorf("failed generate token. err: %w", err)
	}
	return b, nil
}

func signMessage(message []byte, secretKey string) []byte {
	h := hmac.New(sha256.New, []byte(secretKey))
	h.Write(message)
	return h.Sum(nil)
}

func (s *sessionService) GenerateSignedSession() (string, error) {
	randomBytes, err := generateRandomBytes(digit)
	if err != nil {
		return "", fmt.Errorf("failed generate random bytes. err: %w", err)
	}

	signature := signMessage(randomBytes, s.secretKey)
	signedString := hex.EncodeToString(randomBytes) + hex.EncodeToString(signature)
	return signedString, nil
}

func (s *sessionService) VerifyAndExtract(signedString string) ([]byte, bool) {
	if len(signedString) < 64 { // 16 bytes (original message) + 32 bytes (HMAC) in hex
		return nil, false
	}

	originalHex := signedString[:32]
	signatureHex := signedString[32:]

	originalBytes, err := hex.DecodeString(originalHex)
	if err != nil {
		return nil, false
	}

	signatureBytes, err := hex.DecodeString(signatureHex)
	if err != nil {
		return nil, false
	}

	expectedSignature := signMessage(originalBytes, s.secretKey)
	if hmac.Equal(expectedSignature, signatureBytes) {
		return originalBytes, true
	}
	return nil, false
}

func (s *sessionService) GetSessionExpireTime(ctx context.Context) (time.Time, error) {
	txTime := txtime.GetTxTime(ctx)
	return txTime.Add(s.sessionDuration), nil
}

func (s *sessionService) StartSession(ctx context.Context, user model.User, session model.Session) error {
	err := s.sessionRepository.Insert(ctx, session, user.ID)
	if err != nil {
		return fmt.Errorf("failed start session. err: %w", err)
	}
	return nil
}

func (s *sessionService) GetUserBySession(ctx context.Context, session model.Session) (model.User, error) {
	userID, err := s.sessionRepository.Get(ctx, session.Session)
	if err != nil {
		if err == repository.ErrNotFound {
			return model.User{}, ErrorNotFoundSession
		}
		return model.User{}, fmt.Errorf("failed get user by session, err: %w", err)
	}

	user, err := s.userRepository.Get(ctx, userID)
	if err != nil {
		if err == repository.ErrNotFound {
			return model.User{}, ErrorNotFoundUser
		}
		return model.User{}, fmt.Errorf("failed get user from user repository, err: %w", err)
	}
	return user, nil
}

func (s *sessionService) GetAuthenticatedSession(ctx context.Context, session model.Session) (model.AuthenticatedSession, error) {

	user, err := s.GetUserBySession(ctx, session)
	if err != nil {
		if err == ErrorNotFoundUser {
			return model.AuthenticatedSession{}, ErrorNotFoundUser
		}
		if err == ErrorNotFoundSession {
			return model.AuthenticatedSession{}, ErrorNotFoundSession
		}
		return model.AuthenticatedSession{}, fmt.Errorf("failed get user by session. err: %w", err)
	}

	return model.AuthenticatedSession{
		Session: session.Session,
		UserID:  user.ID,
		// TODO これから認可情報をどんどん追加していく
	}, nil

}

func (s *sessionService) DeleteSession(ctx context.Context, session model.Session) error {
	err := s.sessionRepository.Delete(ctx, session)
	if err != nil {
		return fmt.Errorf("failed delete session. err: %w", err)
	}
	return nil
}
