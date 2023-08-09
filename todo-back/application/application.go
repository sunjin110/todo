package application

func derefOrDefault[T any](ptr *T, def T) T {
	if ptr != nil {
		return *ptr
	}
	return def
}
