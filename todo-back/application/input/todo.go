package input

import (
	"time"
	"todo-back/domain/model"
	"todo-back/domain/repository"
)

type TodoList struct {
	Session model.Session
	Paging  *repository.Paging
	Sorting *repository.TodoSort
	Filter  *repository.TodoFilter
}

type GetTodo struct {
	Session model.Session
	TodoID  model.TodoID
}

type CreateTodoModel struct {
	Title       string
	Description string
	Status      model.TodoStatus
	StartTime   *time.Time
	// そのほかも色々要素を追加するのだ
}

type CreateTodo struct {
	Session model.Session
	Todo    CreateTodoModel
}

type UpdateTodoModel struct {
	ID          model.TodoID
	Title       *string
	Description *string
	Status      *model.TodoStatus
}

type UpdateTodo struct {
	Session model.Session
	Todo    UpdateTodoModel
}

type DeleteTodo struct {
	Session model.Session
	TodoID  model.TodoID
}
