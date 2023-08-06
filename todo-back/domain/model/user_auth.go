package model

import "time"

// UserSignUpStatus 利用者のサインアップ状況
type UserSignUpStatus string

func (u UserSignUpStatus) String() string {
	return string(u)
}

const (
	SignUpAllowed      UserSignUpStatus = "allowed"
	SignUpWaitForAllow UserSignUpStatus = "wait_for_allow"
	SignUpDenied       UserSignUpStatus = "denied"
)

type Session struct {
	Session    string
	ExpireTime *time.Time
}

// AuthenticatedSession 認証が終わった後のsession情報、認可情報はこれを信頼していい
type AuthenticatedSession struct {
	Session string
	UserID  UserID
	// 認可情報とかを載せていきたい
}
