package model

import "time"

type TodoStatus string
type TodoID string

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
