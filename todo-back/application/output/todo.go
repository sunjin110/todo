package output

import "todo-back/domain/model"

type GetTodo struct {
	Todo model.Todo
}

type ListTodo struct {
	Todos   []model.Todo
	HasNext bool
}
