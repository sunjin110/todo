package repository

import (
	"context"
	"fmt"
	"todo-back/domain/model"
	"todo-back/domain/repository"
	"todo-back/infrastructure/mongo"
	"todo-back/infrastructure/repository/dto"

	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/mongo/options"
)

type user struct {
	mongoDB *mongo.Database
}

func NewUser(mongoDB *mongo.Database) repository.User {
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

	userID := result.InsertedID.(string)
	return model.UserID(userID), nil
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

func (u *user) GetByEmail(ctx context.Context, email string) (model.User, error) {
	dtoUser := dto.User{}
	err := u.mongoDB.Collection(mongo.UserColl).FindOne(ctx, bson.M{"email": email}).Decode(&dtoUser)
	if err != nil {
		if err == mongo.ErrNotDocuments {
			return model.User{}, repository.ErrNotFound
		}
		return model.User{}, fmt.Errorf("failed get user by email. email: %s, err: %w", email, err)
	}
	return *dtoUser.ToModel(), nil
}

func (u *user) List(ctx context.Context, request repository.UserListRequest) (repository.UserListOutput, error) {
	opts := options.Find()
	opts = mongo.AppendPaging(opts, request.Paging)
	if request.Sort != nil {
		opts = mongo.AppendSorting(opts, map[string]*repository.SortField{
			"ct": request.Sort.CreateTime,
			"lt": request.Sort.LastLogin,
		})
	}

	filter := bson.M{}
	if request.Filter != nil {
		if request.Filter.ID != nil {
			filter["_id"] = request.Filter.ID.Value.String()
		}
		// TODO domainのコードで完全一致のみサポートすることを宣言する
		if request.Filter.Name != nil {
			filter["name"] = request.Filter.Name.Value
		}
		if request.Filter.Email != nil {
			filter["email"] = request.Filter.Email.Value
		}
	}

	cursor, err := u.mongoDB.Collection(mongo.UserColl).Find(ctx, filter, opts)
	if err != nil {
		return repository.UserListOutput{}, fmt.Errorf("failed find user list, err: %w", err)
	}

	users := []*dto.User{}
	err = cursor.All(ctx, &users)
	if err != nil {
		return repository.UserListOutput{}, fmt.Errorf("failed cursor all user list, err: %w", err)
	}

	return repository.UserListOutput{
		List:    mongo.GenerateList[*dto.User, model.User](users, request.Paging),
		HasNext: mongo.HasNext(users, request.Paging),
	}, nil

}
