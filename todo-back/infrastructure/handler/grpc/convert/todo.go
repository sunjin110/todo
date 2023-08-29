package convert

import (
	"time"
	"todo-back/application/input"
	"todo-back/application/output"
	"todo-back/domain/model"
	"todo-back/domain/repository"
	"todo-back/infrastructure/handler/grpc/proto_go_gen/todo"
	"todo-back/infrastructure/handler/grpc/proto_go_gen/user"

	"google.golang.org/protobuf/types/known/timestamppb"
)

func ToModelListTodoInput(in *todo.ListInput) *input.TodoList {
	return &input.TodoList{
		Session: *ToModelSession(in.Session),
		Paging:  toRepositoryPaging(in.Paging),
		Sorting: toRepositoryTodoSort(in.Sort),
		Filter:  toRepositoryTodoFilter(in.Filter),
	}
}

func ToGrpcListTodoOutput(out *output.ListTodo) *todo.ListOutput {
	return &todo.ListOutput{
		HasNext: out.HasNext,
		Todos:   toGrpcTodoList(out.Todos),
	}
}

func toRepositoryTodoSort(sort *todo.TodoSort) *repository.TodoSort {
	if sort == nil {
		return nil
	}
	return &repository.TodoSort{
		CreateTime: toRepositorySortField(sort.CreateTime),
		DoneTime:   toRepositorySortField(sort.DoneTime),
	}
}

func toRepositoryTodoFilter(filter *todo.TodoFilter) *repository.TodoFilter {
	if filter == nil {
		return nil
	}

	return &repository.TodoFilter{
		ID:          toRepositoryFilterField(toModelTodoID(filter.Id), nil),
		Title:       toRepositoryFilterField(filter.Title, filter.TitleFilterKind),
		Description: toRepositoryFilterField(filter.Description, filter.DescriptionFilterKind),
		Status:      toRepositoryFilterField(toModelTodoStatus(filter.Status), nil),
	}
}

func ToModelGetTodoInput(in *todo.GetInput) *input.GetTodo {
	return &input.GetTodo{
		TodoID:  model.TodoID(in.Id.Id),
		Session: *ToModelSession(in.Session),
	}
}

func ToGRPCGetTodoOutput(out *output.GetTodo) *todo.GetOutput {
	return &todo.GetOutput{
		Todo: toGrpcTodo(&out.Todo),
	}
}

func ToModelCreateTodoInput(in *todo.CreateInput) *input.CreateTodo {
	var startTime *time.Time
	if in.Todo.StartTime != nil {
		st := in.Todo.StartTime.AsTime()
		startTime = &st
	}

	return &input.CreateTodo{
		Session: *ToModelSession(in.Session),
		Todo: input.CreateTodoModel{
			Title:       in.Todo.Title,
			Description: in.Todo.Description,
			Status:      *toModelTodoStatus(&in.Todo.Status),
			StartTime:   startTime,
		},
	}
}

func ToModelUpdateTodoInput(in *todo.UpdateInput) *input.UpdateTodo {

	return &input.UpdateTodo{
		Session: *ToModelSession(in.Session),
		Todo: input.UpdateTodoModel{
			ID:          model.TodoID(in.Todo.Id.Id),
			Title:       in.Todo.Title,
			Description: in.Todo.Description,
			Status:      toModelTodoStatus(in.Todo.Status),
		},
	}
}

func ToModelDeleteTodoInput(in *todo.DeleteInput) *input.DeleteTodo {
	return &input.DeleteTodo{
		Session: *ToModelSession(in.Session),
		TodoID:  model.TodoID(in.Id.Id),
	}
}

func toGrpcTodoList(models []model.Todo) []*todo.Todo {
	list := make([]*todo.Todo, 0, len(models))
	for _, m := range models {
		list = append(list, toGrpcTodo(&m))
	}
	return list
}

func toGrpcTodo(todoModel *model.Todo) *todo.Todo {
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

func toModelTodoStatus(status *todo.Status) *model.TodoStatus {
	if status == nil {
		return nil
	}

	switch *status {
	case todo.Status_scheduled:
		return toPointer(model.ScheduledStatus)
	case todo.Status_done:
		return toPointer(model.DoneStatus)
	case todo.Status_draft:
		return toPointer(model.DraftStatus)
	default:
		return toPointer(model.DoneStatus)
	}
}

func toModelTodoID(id *todo.TodoId) *model.TodoID {
	if id == nil {
		return nil
	}
	return toPointer(model.TodoID(id.Id))
}
