package primary

import "github.com/google/uuid"

func ID() string {
	u, err := uuid.NewRandom()
	if err != nil {
		panic(err)
	}
	return u.String()
}
