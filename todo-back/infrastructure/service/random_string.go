package service

type RandomString interface {
	Generate(digit uint32) (string, error)
}

const randomStringLetters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

type randomString struct {
}

func NewRandomString() RandomString {
	return &randomString{}
}

func (rs *randomString) Generate(digit uint32) (string, error) {
	// https: //qiita.com/nakaryooo/items/7d269525a288c4b3ecda
}
