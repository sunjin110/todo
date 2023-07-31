package dto

import (
	"todo-back/domain/model"
)

type Todo struct {
	ID                  string        `bson:"_id"`
	Title               string        `bson:"title"`
	TitleSegments       []string      `bson:"title_segments"`
	Description         string        `bson:"desc"`
	DescriptionSegments []string      `bson:"desc_segments"`
	UserID              string        `bson:"user_id"`
	Status              string        `bson:"status"`
	Schedule            *TodoSchedule `bson:"schedule"`
	CreateTime          int64         `bson:"ct"` // unix time
	DoneTime            *int64        `bson:"dt"`
}

func (t *Todo) ToModel() *model.Todo {
	if t == nil {
		return nil
	}

	return &model.Todo{
		ID:          model.TodoID(t.ID),
		Title:       t.Title,
		Description: t.Description,
		UserID:      model.UserID(t.UserID),
		Schedule:    t.Schedule.ToModel(),
		Status:      model.TodoStatus(t.Status),
		CreateTime:  *convertUnixToTime(&t.CreateTime),
		DoneTime:    convertUnixToTime(t.DoneTime),
	}
}

type TodoSchedule struct {
	PlannedStartTime *int64 `bson:"planned_st"`
	PlannedEndTime   *int64 `bson:"planned_et"`
}

func (ts *TodoSchedule) ToModel() *model.TodoSchedule {
	if ts == nil {
		return nil
	}
	return &model.TodoSchedule{
		PlannedStartTime: convertUnixToTime(ts.PlannedStartTime),
		PlannedEndTime:   convertUnixToTime(ts.PlannedEndTime),
	}
}

func NewTodo(todoModel model.Todo, titleSegments []string, descriptionSegments []string) Todo {
	return Todo{
		ID:                  todoModel.ID.String(),
		Title:               todoModel.Title,
		TitleSegments:       titleSegments,
		Description:         todoModel.Description,
		DescriptionSegments: descriptionSegments,
		UserID:              todoModel.UserID.String(),
		Status:              todoModel.Status.String(),
		CreateTime:          *convertTimeToUnix(&todoModel.CreateTime),
		DoneTime:            convertTimeToUnix(todoModel.DoneTime),
	}
}

func NewTodoSchedule(schedule *model.TodoSchedule) *TodoSchedule {
	if schedule == nil {
		return nil
	}

	return &TodoSchedule{
		PlannedStartTime: convertTimeToUnix(schedule.PlannedStartTime),
		PlannedEndTime:   convertTimeToUnix(schedule.PlannedEndTime),
	}
}
