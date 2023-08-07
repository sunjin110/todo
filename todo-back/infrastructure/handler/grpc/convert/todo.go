package convert

import (
	"todo-back/application/input"
	"todo-back/domain/model"
	"todo-back/infrastructure/handler/grpc/proto_go_gen/todo"
)

func ToModelGetTodoInput(in *todo.GetInput) *input.GetTodo {
	return &input.GetTodo{
		TodoID:  model.TodoID(in.Id.Id),
		Session: *ToModelSession(in.Session),
	}
}
