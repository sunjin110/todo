package model

import (
	"time"
	"todo-back/domain/common/primary"
)

type TodoStatus string

func (s TodoStatus) String() string {
	return string(s)
}

type TodoID string

func NewTodoID() TodoID {
	return TodoID(primary.ID())
}

func (t TodoID) String() string {
	return string(t)
}

const (
	DoneStatus      TodoStatus = "done"
	ScheduledStatus TodoStatus = "scheduled"
	DraftStatus     TodoStatus = "draft"
)

type Todo struct {
	ID          TodoID
	Title       string
	Description string
	UserID      UserID
	Schedule    *TodoSchedule
	Status      TodoStatus
	CreateTime  time.Time
	DoneTime    *time.Time
}

type TodoSchedule struct {
	PlannedStartTime *time.Time
	PlannedEndTime   *time.Time
}
