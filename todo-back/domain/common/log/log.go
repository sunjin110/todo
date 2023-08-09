package log

import (
	"context"
	"time"
)

var globalManager Manager

func SetGlobalManager(m Manager) {
	globalManager = m
}

func GetLogger(ctx context.Context) Logger {
	return globalManager.GetLogger(ctx)
}

type Manager interface {
	GetLogger(ctx context.Context) Logger
}

type Logger interface {
	Trace() Event
	Debug() Event
	Info() Event
	Warn() Event
	Error() Event
}

type LogObjectMarshaler interface {
	MarshalLogObject(e Event)
}

type LogArrayMarshaler interface {
	MarshalLogArray(a Array)
}

type Event interface {
	Str(k, v string) Event
	Int(k string, v int) Event
	Object(k string, objMarshaler LogObjectMarshaler) Event
	Array(k string, arrayMarshaler LogArrayMarshaler) Event
	Time(k string, t time.Time) Event
	Duration(k string, d time.Duration) Event
	Err(err error) Event
	AnErr(k string, err error) Event
	Interface(k string, v interface{}) Event
	Stack() Event
	Msg(msg string)
	Send()
}

type Array interface {
	Str(val string) Array
	Int(val int) Array
	Object(obj LogObjectMarshaler) Array
	Err(err error) Array
	Time(t time.Time) Array
}
