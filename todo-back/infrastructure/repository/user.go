package infrastructure

import (
	"todo-back/domain/repository"
	"todo-back/infrastructure/mongo"
)

type user struct {
	mongoDB mongo.Database
}

func NewUser(mongoClient mongo.Client) repository.User {
	return nil
}
