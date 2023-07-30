package infrastructure

import "todo-back/infrastructure/mongo"

type user struct {
	mongoClient mongo.Client
}

func NewUser(mongoClient mongo.Client)
