package convert

func toPointer[T any](a T) *T {
	return &a
}
