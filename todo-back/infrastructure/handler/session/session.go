package session

import (
	"crypto/hmac"
	"crypto/rand"
	"crypto/sha256"
	"encoding/hex"
	"fmt"
)

type SessionService interface {
	GenerateSignedSession() (string, error)
	VerifyAndExtract(signedString string) ([]byte, bool)
}

type sessionService struct {
	secretKey string
}

func NewSessionService(secretKey string) SessionService {
	return &sessionService{
		secretKey: secretKey,
	}
}

const digit = 16

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

	fmt.Println("Random Bytes:", hex.EncodeToString(randomBytes))
	fmt.Println("Signature:", hex.EncodeToString(signature))

	signedString := hex.EncodeToString(randomBytes) + hex.EncodeToString(signature)
	fmt.Println("Signed String:", signedString)
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
