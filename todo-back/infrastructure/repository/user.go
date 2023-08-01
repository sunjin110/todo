package infrastructure

import (
	"context"
	"fmt"
	"todo-back/domain/model"
	"todo-back/domain/repository"
	"todo-back/infrastructure/mongo"
	"todo-back/infrastructure/repository/dto"

	"go.mongodb.org/mongo-driver/bson"
)

type user struct {
	mongoDB mongo.Database
}

func NewUser(mongoDB mongo.Database) repository.User {
	return &user{
		mongoDB: mongoDB,
	}
}

func (u *user) Create(ctx context.Context, user model.User) (model.UserID, error) {
	userDto := dto.NewUser(user)

	result, err := u.mongoDB.Collection(mongo.UserColl).InsertOne(ctx, &userDto)
	if err != nil {
		return "", fmt.Errorf("failed insert user. user: %+v, err: %w", user, err)
	}

	return result.InsertedID.(model.UserID), nil
}

func (u *user) Update(ctx context.Context, id model.UserID, updatedUser model.User) error {
	userDto := dto.NewUser(updatedUser)

	_, err := u.mongoDB.Collection(mongo.UserColl).UpdateOne(ctx, bson.M{"_id": id.String()}, &userDto)
	if err != nil {
		return fmt.Errorf("failed update user. user: %+v, err: %w", updatedUser, err)
	}
	return nil
}

func (u *user) Delete(ctx context.Context, id model.UserID) error {
	_, err := u.mongoDB.Collection(mongo.UserColl).DeleteOne(ctx, bson.M{"_id": id.String()})
	if err != nil {
		return fmt.Errorf("failed dleete user. user_id: %s, err: %w", id.String(), err)
	}
	return nil
}

func (u *user) Get(ctx context.Context, id model.UserID) (model.User, error) {
	dtoUser := dto.User{}
	err := u.mongoDB.Collection(mongo.UserColl).FindOne(ctx, bson.M{"_id": id.String()}).Decode(&dtoUser)
	if err != nil {
		if err == mongo.ErrNotDocuments {
			return model.User{}, repository.ErrNotFound
		}
		return model.User{}, fmt.Errorf("failed get user. err: %w", err)
	}
	return *dtoUser.ToModel(), nil
}

func (u *user) List(ctx context.Context, request repository.UserListRequest) (repository.UserListOutput, error) {
	panic("todo")
}
