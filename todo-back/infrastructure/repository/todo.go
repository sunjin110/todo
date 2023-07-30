package infrastructure

import (
	"context"
	"todo-back/domain/model"
	"todo-back/domain/repository"
)

type todo struct {
}

func NewTodo() repository.Todo {
	return &todo{}
}

func (t *todo) Create(ctx context.Context, todo model.Todo) (model.TodoID, error) {
	panic("todo")
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
