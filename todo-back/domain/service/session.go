package service

type SessionService interface {
	GenerateSignedSession() (string, error)
	VerifyAndExtract(signedString string) ([]byte, bool)
}
