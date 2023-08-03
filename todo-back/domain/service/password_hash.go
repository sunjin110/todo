package service

import (
	"crypto/hmac"
	"crypto/sha256"
	"encoding/hex"
)

type PasswordHash interface {
	CreateHash(password string) string
}

type passwordHash struct {
	secret string
}

func NewPasswordHash(secret string) PasswordHash {
	return &passwordHash{
		secret: secret,
	}
}

func (p *passwordHash) CreateHash(password string) string {
	h := hmac.New(sha256.New, []byte(p.secret))
	h.Write([]byte(password))
	return hex.EncodeToString(h.Sum(nil))
}
