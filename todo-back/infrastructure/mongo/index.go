package mongo

import (
	"context"
	"fmt"

	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
)

func CreateIndex(ctx context.Context, db *Database) error {
	// users
	userIndexes := []mongo.IndexModel{
		{
			Keys: bson.D{
				{
					Key:   "email",
					Value: 1,
				},
				{
					Key:   "pwd_hash",
					Value: 1,
				},
			},
			Options: options.Index().SetUnique(true),
		},
	}
	_, err := db.Collection(UserColl).Indexes().CreateMany(ctx, userIndexes)
	if err != nil {
		return fmt.Errorf("failed create user indexes. err: %w", err)
	}

	todoIndexes := []mongo.IndexModel{
		{
			Keys: bson.D{
				{
					Key:   "title",
					Value: 1,
				},
			},
		},
		{
			Keys: bson.D{
				{
					Key:   "title_segments",
					Value: 1,
				},
			},
		},
		{
			Keys: bson.D{
				{
					Key:   "desc",
					Value: 1,
				},
			},
		},
		{
			Keys: bson.D{
				{
					Key:   "desc_segments",
					Value: 1,
				},
			},
		},
		{
			Keys: bson.D{
				{
					Key:   "user_id",
					Value: 1,
				},
			},
		},
		{
			Keys: bson.D{
				{
					Key:   "status",
					Value: 1,
				},
			},
		},
	}

	_, err = db.Collection(TodoColl).Indexes().CreateMany(ctx, todoIndexes)
	if err != nil {
		return fmt.Errorf("failed create todo indexes. err: %w", err)
	}

	return nil
}
