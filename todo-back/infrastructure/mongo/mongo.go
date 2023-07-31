package mongo

import (
	"context"
	"fmt"
	"todo-back/domain/repository"

	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
	"go.mongodb.org/mongo-driver/mongo/readpref"
)

type Client = mongo.Client

type Database = mongo.Database

const (
	UserDB = "users"
	TodoDB = "todos"
)

var ErrNotDocuments = mongo.ErrNoDocuments

func Connect(ctx context.Context, uri string) (*Client, error) {
	client, err := mongo.Connect(ctx, options.Client().ApplyURI(uri))
	if err != nil {
		return nil, fmt.Errorf("failed connection mongodb. uri: %s, err: %w", uri, err)
	}
	if err := client.Ping(ctx, readpref.Primary()); err != nil {
		return nil, fmt.Errorf("failed ping mongodb. uri: %s, err: %w", uri, err)
	}
	return nil, nil
}

func AppendPaging(opts *options.FindOptions, paging *repository.Paging) *options.FindOptions {
	if paging == nil {
		return opts
	}
	opts.SetLimit(int64(paging.Limit + 1)) // hasNextのために
	opts.SetSkip(int64(paging.Offset))
	return opts
}

func PutStringFilter(filter bson.M, filterField *repository.FilterField[string], perfectField string, partialField string) (bson.M, error) {
	if filterField == nil {
		return filter, nil
	}

	switch filterField.Kind {
	case repository.PerfectMatch:
		filter[perfectField] = filterField.Value
	case repository.PartialMatch:
		filter[partialField] = filterField.Value
	default:
		return filter, fmt.Errorf("not implemented filter kind. desc kind: %s", filterField.Kind)
	}
	return filter, nil
}

func HasNext[T any](list []T, paging *repository.Paging) bool {
	if paging == nil {
		return false
	}
	return len(list) < int(paging.Limit)
}
