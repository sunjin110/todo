package input

import (
	"todo-back/domain/model"
	"todo-back/domain/repository"
)

type TodoList struct {
	Session model.AuthenticatedSession
	Paging  *repository.Paging
	Sorting *repository.TodoSort
	Filter  *repository.TodoFilter
}

type GetTodo struct {
	Session model.AuthenticatedSession
	TodoID  model.TodoID
}

type CreateTodoModel struct {
	Title       string
	Description string
	Status      model.TodoStatus
	// そのほかも色々要素を追加するのだ
}

type CreateTodo struct {
	Session model.AuthenticatedSession
	Todo    CreateTodoModel
}

type UpdateTodoModel struct {
	ID          model.TodoID
	Title       *string
	Description *string
	Status      *model.TodoStatus
}

type UpdateTodo struct {
	Session model.AuthenticatedSession
	Todo    UpdateTodoModel
}

type DeleteTodo struct {
	Session model.AuthenticatedSession
	TodoID  model.TodoID
}
