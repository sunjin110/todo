package application

import "errors"

var (
	ErrorNotFound         = errors.New("not found")
	ErrorPasswordNotMatch = errors.New("password not match")
)
