package infrastructure

import (
	"context"
	"fmt"
	"todo-back/domain/model"
	"todo-back/domain/repository"
	"todo-back/domain/service"
	"todo-back/infrastructure/mongo"
	"todo-back/infrastructure/repository/dto"
)

type todo struct {
	mongoDB                      mongo.Database
	morphologicalAnalysisService service.MorphologicalAnalysis
	morphologicalLang            service.MorphologicalLang
}

func NewTodo(mongoDB mongo.Database, morphologicalAnalysisService service.MorphologicalAnalysis, morphologicalLang service.MorphologicalLang) repository.Todo {
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

	result, err := t.mongoDB.Collection("todos").InsertOne(ctx, &todoDto)
	if err != nil {
		return "", fmt.Errorf("failed insert. todo: %+v, err: %w", todo, err)
	}
	if err != nil {
		return "", fmt.Errorf("failed insert. err: %w", err)
	}
	return result.InsertedID.(model.TodoID), nil
}

func (t *todo) Update(ctx context.Context, id model.TodoID, updatedTodo model.Todo) error {
	panic("todo")
}
func (t *todo) Delete(ctx context.Context, id model.TodoID) error {
	panic("todo")
}
func (t *todo) Get(ctx context.Context, id model.TodoID) (model.Todo, error) {
	panic("todo")
}
func (t *todo) List(ctx context.Context, request repository.TodoListRequest) (repository.TodoListOutput, error) {
	panic("todo")
}
