package dto

type SessionValue struct {
	ExpireTime int64  `json:"expire_time"` // UnixTime
	UserID     string `json:"user_id"`
}
