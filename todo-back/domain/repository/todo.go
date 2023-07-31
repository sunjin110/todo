package repository

import (
	"context"
	"todo-back/domain/model"
)

type TodoListRequest struct {
	Paging  *Paging
	Sorting *TodoSort
	Filter  *TodoFilter
}

type TodoListOutput struct {
	TodoList []model.Todo
	HasNext  bool
}

type TodoSort struct {
	CreateTime *SortField
	DoneTime   *SortField
}

type TodoFilter struct {
	ID          *FilterField[model.TodoID]
	Title       *FilterField[string]
	Description *FilterField[string]
	Status      *FilterField[model.TodoStatus]
}

type Todo interface {
	Create(ctx context.Context, todo model.Todo) (model.TodoID, error)
	Update(ctx context.Context, id model.TodoID, updatedTodo model.Todo) error
	Delete(ctx context.Context, id model.TodoID) error
	Get(ctx context.Context, id model.TodoID) (model.Todo, error)
	List(ctx context.Context, request TodoListRequest) (TodoListOutput, error)
}
