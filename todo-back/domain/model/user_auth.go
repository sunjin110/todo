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
