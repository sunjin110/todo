package convert

import (
	"todo-back/application/input"
	"todo-back/application/output"
	"todo-back/domain/model"
	"todo-back/infrastructure/handler/grpc/proto_go_gen/todo"
	"todo-back/infrastructure/handler/grpc/proto_go_gen/user"

	"google.golang.org/protobuf/types/known/timestamppb"
)

func ToModelGetTodoInput(in *todo.GetInput) *input.GetTodo {
	return &input.GetTodo{
		TodoID:  model.TodoID(in.Id.Id),
		Session: *ToModelSession(in.Session),
	}
}

func ToGRPCGetTodoOutput(out *output.GetTodo) *todo.GetOutput {
	return &todo.GetOutput{
		Todo: ToGrpcTodo(&out.Todo),
	}
}

func ToModelCreateTodoInput(in *todo.CreateInput) *input.CreateTodo {
	return &input.CreateTodo{
		Session: *ToModelSession(in.Session),
		Todo: input.CreateTodoModel{
			Title:       in.Todo.Title,
			Description: in.Todo.Description,
			Status:      ToModelTodoStatus(in.Todo.Status),
		},
	}
}

func ToModelUpdateTodoInput(in *todo.UpdateInput) *input.UpdateTodo {

	var status *model.TodoStatus
	if in.Todo.Status != nil {
		s := ToModelTodoStatus(*in.Todo.Status)
		status = &s
	}

	return &input.UpdateTodo{
		Session: *ToModelSession(in.Session),
		Todo: input.UpdateTodoModel{
			ID:          model.TodoID(in.Todo.Id.Id),
			Title:       in.Todo.Title,
			Description: in.Todo.Description,
			Status:      status,
		},
	}
}

func ToModelDeleteTodoInput(in *todo.DeleteInput) *input.DeleteTodo {
	return &input.DeleteTodo{
		Session: *ToModelSession(in.Session),
		TodoID:  model.TodoID(in.Id.Id),
	}
}

func ToGrpcTodo(todoModel *model.Todo) *todo.Todo {
	return &todo.Todo{
		Id: &todo.TodoId{
			Id: todoModel.ID.String(),
		},
		Title:       todoModel.Title,
		Description: todoModel.Description,
		Status:      ToGrpcTodoStatus(todoModel.Status),
		UserId: &user.UserId{
			Id: todoModel.UserID.String(),
		},
		CreateTime: timestamppb.New(todoModel.CreateTime),
	}
}

func ToGrpcTodoStatus(status model.TodoStatus) todo.Status {
	switch status {
	case model.ScheduledStatus:
		return todo.Status_scheduled
	case model.DoneStatus:
		return todo.Status_done
	case model.DraftStatus:
		return todo.Status_draft
	default:
		return todo.Status_done
	}
}

func ToModelTodoStatus(status todo.Status) model.TodoStatus {
	switch status {
	case todo.Status_scheduled:
		return model.ScheduledStatus
	case todo.Status_done:
		return model.DoneStatus
	case todo.Status_draft:
		return model.DraftStatus
	default:
		return model.DoneStatus
	}
}
