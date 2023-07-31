package infrastructure

import (
	"todo-back/domain/repository"
	"todo-back/infrastructure/mongo"
)

type user struct {
	mongoClient mongo.Client
}

func NewUser(mongoClient mongo.Client) repository.User {
	return nil
}
