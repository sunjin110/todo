package application

import (
	"context"
	"fmt"
	"todo-back/application/input"
	"todo-back/application/output"
	"todo-back/domain/common/txtime"
	"todo-back/domain/model"
	"todo-back/domain/repository"
)

type Todo interface {
}

type todo struct {
	todoRepository repository.Todo
}

func (todo *todo) List(ctx context.Context, input input.TodoList) {

}

func (t *todo) Get(ctx context.Context, input input.GetTodo) (*output.GetTodo, error) {

	todo, err := t.todoRepository.Get(ctx, input.TodoID)
	if err != nil {
		if err == repository.ErrNotFound {
			return nil, ErrorNotFound
		}
		return nil, fmt.Errorf("failed get todo. todoID: %s, err: %w", input.TodoID, err)
	}
	return &output.GetTodo{
		Todo: todo,
	}, nil
}

func (t *todo) Create(ctx context.Context, input input.CreateTodo) error {

	txTime := txtime.GetTxTime(ctx)

	_, err := t.todoRepository.Create(ctx, model.Todo{
		ID:          model.NewTodoID(),
		Title:       input.Todo.Title,
		UserID:      input.Session.UserID, // 今は自分のものだけ作れるような作り
		Description: input.Todo.Description,
		Status:      input.Todo.Status,
		Schedule:    nil, // TODO後で作る
		CreateTime:  txTime,
		DoneTime:    nil, // 後で作る
	})
	if err != nil {
		return fmt.Errorf("failed create todo. err: %w", err)
	}
	return nil
}

func (t *todo) Update(ctx context.Context, input input.UpdateTodo) error {
	beforeTodo, err := t.todoRepository.Get(ctx, input.Todo.ID)
	if err != nil {
		if err == repository.ErrNotFound {
			return ErrorNotFound
		}
		return fmt.Errorf("failed update todo. failed get before todo. err: %w", err)
	}

	err = t.todoRepository.Update(ctx, input.Todo.ID, t.generateUpdatedTodo(beforeTodo, input.Todo))
	if err != nil {
		return fmt.Errorf("failed update todo. err: %w", err)
	}
	return nil
}

func (t *todo) Delete(ctx context.Context, input input.DeleteTodo) error {
	err := t.todoRepository.Delete(ctx, input.TodoID)
	if err != nil {
		return fmt.Errorf("failed delete todo, err: %w", err)
	}
	return nil
}

func (t *todo) generateUpdatedTodo(beforeTodo model.Todo, updateTodo input.UpdateTodoModel) model.Todo {
	if updateTodo.Title != nil {
		beforeTodo.Title = *updateTodo.Title
	}

	if updateTodo.Description != nil {
		beforeTodo.Description = *updateTodo.Description
	}

	if updateTodo.Status != nil {
		beforeTodo.Status = *updateTodo.Status
	}
	return beforeTodo
}
