package dto

import (
	"todo-back/domain/model"
)

type Todo struct {
	ID                  string   `bson:"_id"`
	Title               string   `bson:"title"`
	TitleSegments       []string `bson:"title_segments"`
	Description         string   `bson:"desc"`
	DescriptionSegments []string `bson:"desc_segments"`
	UserID              string   `bson:"user_id"`
	Status              string   `bson:"status"`
	CreateTime          int64    `bson:"ct"` // unix time
	DoneTime            *int64   `bson:"dt"`
}

func NewTodo(todoModel model.Todo, titleSegments []string, descriptionSegments []string) Todo {
	var doneTime *int64
	if todoModel.DoneTime != nil {
		dt := todoModel.DoneTime.Unix()
		doneTime = &dt
	}

	return Todo{
		ID:                  todoModel.ID.String(),
		Title:               todoModel.Title,
		TitleSegments:       titleSegments,
		Description:         todoModel.Description,
		DescriptionSegments: descriptionSegments,
		UserID:              todoModel.UserID.String(),
		Status:              todoModel.Status.String(),
		CreateTime:          todoModel.CreateTime.Unix(),
		DoneTime:            doneTime,
	}
}
