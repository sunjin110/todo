package repository

import (
	"context"
	"fmt"
	"todo-back/domain/model"
	"todo-back/domain/repository"
	"todo-back/domain/service"
	"todo-back/infrastructure/mongo"
	"todo-back/infrastructure/repository/dto"

	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/mongo/options"
)

type todo struct {
	mongoDB                      *mongo.Database
	morphologicalAnalysisService service.MorphologicalAnalysis
	morphologicalLang            service.MorphologicalLang
}

func NewTodo(mongoDB *mongo.Database, morphologicalAnalysisService service.MorphologicalAnalysis, morphologicalLang service.MorphologicalLang) repository.Todo {
	return &todo{
		mongoDB:                      mongoDB,
		morphologicalAnalysisService: morphologicalAnalysisService,
		morphologicalLang:            morphologicalLang,
	}
}

func (t *todo) Create(ctx context.Context, todo model.Todo) (model.TodoID, error) {
	titleSegments, err := t.morphologicalAnalysisService.TextSegmentation(t.morphologicalLang, todo.Title)
	if err != nil {
		return "", fmt.Errorf("failed insert. err: %w", err)
	}

	descSegments, err := t.morphologicalAnalysisService.TextSegmentation(t.morphologicalLang, todo.Description)
	if err != nil {
		return "", fmt.Errorf("failed insert. err: %w", err)
	}

	todoDto := dto.NewTodo(todo, titleSegments, descSegments)

	result, err := t.mongoDB.Collection(mongo.TodoColl).InsertOne(ctx, &todoDto)
	if err != nil {
		return "", fmt.Errorf("failed insert. todo: %+v, err: %w", todo, err)
	}
	todoID := result.InsertedID.(model.UserID)
	return model.TodoID(todoID), nil
}

func (t *todo) Update(ctx context.Context, id model.TodoID, updatedTodo model.Todo) error {
	titleSegments, err := t.morphologicalAnalysisService.TextSegmentation(t.morphologicalLang, updatedTodo.Title)
	if err != nil {
		return fmt.Errorf("failed update. err: %w", err)
	}

	descSegments, err := t.morphologicalAnalysisService.TextSegmentation(t.morphologicalLang, updatedTodo.Description)
	if err != nil {
		return fmt.Errorf("failed update. err: %w", err)
	}

	todoDto := dto.NewTodo(updatedTodo, titleSegments, descSegments)

	_, err = t.mongoDB.Collection(mongo.TodoColl).UpdateOne(ctx, bson.M{"_id": id.String()}, &todoDto)
	if err != nil {
		return fmt.Errorf("failed update. err: %w", err)
	}
	return nil
}

func (t *todo) Delete(ctx context.Context, id model.TodoID) error {
	_, err := t.mongoDB.Collection(mongo.TodoColl).DeleteOne(ctx, bson.M{"_id": id.String()})
	if err != nil {
		return fmt.Errorf("failed delete. id: %s, err: %w", id.String(), err)
	}
	return nil
}
func (t *todo) Get(ctx context.Context, id model.TodoID) (model.Todo, error) {
	dtoTodo := dto.Todo{}
	err := t.mongoDB.Collection(mongo.TodoColl).FindOne(ctx, bson.M{"_id": id.String()}).Decode(&dtoTodo)
	if err != nil {
		if err == mongo.ErrNotDocuments {
			return model.Todo{}, repository.ErrNotFound
		}
		return model.Todo{}, fmt.Errorf("failed get todo. err: %w", err)
	}
	return *dtoTodo.ToModel(), nil
}

func (t *todo) List(ctx context.Context, request repository.TodoListRequest) (_ repository.TodoListOutput, err error) {
	opt := options.Find()
	opt = mongo.AppendPaging(opt, request.Paging)
	if request.Sorting != nil {
		opt = mongo.AppendSorting(opt, map[string]*repository.SortField{
			"ct": request.Sorting.CreateTime,
			"dt": request.Sorting.DoneTime,
		})
	}

	filter := bson.M{}
	if request.Filter != nil {
		if request.Filter.ID != nil {
			filter["_id"] = request.Filter.ID.Value.String()
		}
		filter, err = mongo.PutStringFilter(filter, request.Filter.Title, "title", "title_segments")
		if err != nil {
			return repository.TodoListOutput{}, fmt.Errorf("failed add title filter field. err: %w", err)
		}

		filter, err = mongo.PutStringFilter(filter, request.Filter.Description, "desc", "desc_segments")
		if err != nil {
			return repository.TodoListOutput{}, fmt.Errorf("failed add desc filter field. err: %w", err)
		}
	}

	cursor, err := t.mongoDB.Collection(mongo.TodoColl).Find(ctx, filter, opt)
	if err != nil {
		return repository.TodoListOutput{}, fmt.Errorf("failed find todo list, err: %w", err)
	}

	todos := []*dto.Todo{}
	err = cursor.All(ctx, &todos)
	if err != nil {
		return repository.TodoListOutput{}, fmt.Errorf("failed cursor all todo list, err: %w", err)
	}

	return repository.TodoListOutput{
		TodoList: mongo.GenerateList[*dto.Todo, model.Todo](todos, request.Paging),
		HasNext:  mongo.HasNext(todos, request.Paging),
	}, nil
}
