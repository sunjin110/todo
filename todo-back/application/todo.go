package application

import (
	"context"
	"fmt"
	"todo-back/application/input"
	"todo-back/application/output"
	"todo-back/domain/common/txtime"
	"todo-back/domain/model"
	"todo-back/domain/repository"
	"todo-back/domain/service"
)

type Todo interface {
	List(ctx context.Context, input input.TodoList) (*output.ListTodo, error)
	Get(ctx context.Context, input input.GetTodo) (*output.GetTodo, error)
	Create(ctx context.Context, input input.CreateTodo) error
	Update(ctx context.Context, input input.UpdateTodo) error
	Delete(ctx context.Context, input input.DeleteTodo) error
}

type todo struct {
	todoRepository repository.Todo
	sessionService service.SessionService
}

func NewTodo(todoRepository repository.Todo, sessionService service.SessionService) Todo {
	return &todo{
		todoRepository: todoRepository,
		sessionService: sessionService,
	}
}

func (t *todo) List(ctx context.Context, input input.TodoList) (*output.ListTodo, error) {
	// 今後は認可操作などもしていく
	_, err := t.sessionService.GetAuthenticatedSession(ctx, input.Session)
	if err != nil {
		if err == service.ErrorNotFoundSession ||
			err == service.ErrorNotFoundUser {
			return nil, ErrorAuthentication
		}
	}

	out, err := t.todoRepository.List(ctx, repository.TodoListRequest{
		Paging:  input.Paging,
		Filter:  input.Filter,
		Sorting: input.Sorting,
	})
	if err != nil {
		return nil, fmt.Errorf("failed list todo, input: %v, err: %w", input, err)
	}

	return &output.ListTodo{
		HasNext: out.HasNext,
		Todos:   out.TodoList,
	}, nil
}

func (t *todo) Get(ctx context.Context, input input.GetTodo) (*output.GetTodo, error) {
	// 今後は認可操作などもしていく
	_, err := t.sessionService.GetAuthenticatedSession(ctx, input.Session)
	if err != nil {
		if err == service.ErrorNotFoundSession ||
			err == service.ErrorNotFoundUser {
			return nil, ErrorAuthentication
		}
	}

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
	session, err := t.sessionService.GetAuthenticatedSession(ctx, input.Session)
	if err != nil {
		if err == service.ErrorNotFoundSession ||
			err == service.ErrorNotFoundUser {
			return ErrorAuthentication
		}
	}

	txTime := txtime.GetTxTime(ctx)

	var schedule *model.TodoSchedule
	if input.Todo.StartTime != nil {
		schedule = &model.TodoSchedule{
			PlannedStartTime: input.Todo.StartTime,
		}
	}

	_, err = t.todoRepository.Create(ctx, model.Todo{
		ID:          model.NewTodoID(),
		Title:       input.Todo.Title,
		UserID:      session.UserID, // 今は自分のものだけ作れるような作り
		Description: input.Todo.Description,
		Status:      input.Todo.Status,
		Schedule:    schedule,
		CreateTime:  txTime,
		DoneTime:    nil, // 後で作る
	})
	if err != nil {
		return fmt.Errorf("failed create todo. err: %w", err)
	}
	return nil
}

func (t *todo) Update(ctx context.Context, input input.UpdateTodo) error {
	_, err := t.sessionService.GetAuthenticatedSession(ctx, input.Session)
	if err != nil {
		if err == service.ErrorNotFoundSession ||
			err == service.ErrorNotFoundUser {
			return ErrorAuthentication
		}
	}

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
	_, err := t.sessionService.GetAuthenticatedSession(ctx, input.Session)
	if err != nil {
		if err == service.ErrorNotFoundSession ||
			err == service.ErrorNotFoundUser {
			return ErrorAuthentication
		}
	}

	err = t.todoRepository.Delete(ctx, input.TodoID)
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
