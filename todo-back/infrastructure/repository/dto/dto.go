package dto

import "time"

func convertTimeToUnix(t *time.Time) *int64 {
	if t == nil {
		return nil
	}
	u := t.Unix()
	return &u
}

func convertUnixToTime(u *int64) *time.Time {
	if u == nil {
		return nil
	}
	t := time.Unix(*u, 0)
	return &t
}
