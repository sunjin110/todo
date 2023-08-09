package log

import (
	"context"
	"fmt"
	"time"

	common_log "todo-back/domain/common/log"

	"github.com/rs/zerolog"
	"github.com/rs/zerolog/log"
	"github.com/rs/zerolog/pkgerrors"
)

type logEnv string

const (
	Trace logEnv = "trace"
	Debug logEnv = "dev"
	Info  logEnv = "info"
	Warn  logEnv = "warn"
	Err   logEnv = "err"
)

func Setup(env logEnv) error {
	zerolog.TimeFieldFormat = zerolog.TimeFormatUnix
	zerolog.ErrorStackMarshaler = pkgerrors.MarshalStack
	var level zerolog.Level
	switch env {
	case Trace:
		level = zerolog.TraceLevel
	case Debug:
		level = zerolog.DebugLevel
	case Info:
		level = zerolog.InfoLevel
	case Warn:
		level = zerolog.WarnLevel
	case Err:
		level = zerolog.ErrorLevel
	default:
		return fmt.Errorf("not implemented logEnv. env: %s", env)
	}
	zerolog.SetGlobalLevel(level)
	return nil
}

type key string

const ctxIDKey key = "zerolog-key"

func ContextWithLogger(parent context.Context, id string) context.Context {
	ctx := log.Logger.WithContext(parent)
	return context.WithValue(ctx, ctxIDKey, id)
}

type manager struct {
}

func NewManager() common_log.Manager {
	return &manager{}
}

func (*manager) GetLogger(ctx context.Context) common_log.Logger {
	return NewLogger(ctx)
}

type logger struct {
	inner *zerolog.Logger
	id    string
}

func NewLogger(ctx context.Context) common_log.Logger {
	id, _ := ctx.Value(ctxIDKey).(string)
	return &logger{
		inner: log.Ctx(ctx),
		id:    id,
	}
}

func (l *logger) Trace() common_log.Event {
	return newEvent(l.inner.Trace()).Str("id", l.id)
}

func (l *logger) Debug() common_log.Event {
	return newEvent(l.inner.Debug()).Str("id", l.id)
}

func (l *logger) Info() common_log.Event {
	return newEvent(l.inner.Info()).Str("id", l.id)
}

func (l *logger) Warn() common_log.Event {
	return newEvent(l.inner.Warn()).Str("id", l.id)
}

func (l *logger) Error() common_log.Event {
	return newEvent(l.inner.Error()).Str("id", l.id)
}

type event struct {
	innerEvent *zerolog.Event
}

func newEvent(inner *zerolog.Event) common_log.Event {
	return &event{
		innerEvent: inner,
	}
}

func (e *event) Str(k, v string) common_log.Event {
	e.innerEvent.Str(k, v)
	return e
}

func (e *event) Int(k string, i int) common_log.Event {
	e.innerEvent.Int(k, i)
	return e
}

func (e *event) Object(k string, objMarshaler common_log.LogObjectMarshaler) common_log.Event {
	e.innerEvent.Object(k, &zeroLogObjMarshaler{
		marshaler: objMarshaler,
	})
	return e
}

func (e *event) Stack() common_log.Event {
	e.innerEvent.Stack()
	return e
}

func (e *event) Array(k string, arrayMarshaler common_log.LogArrayMarshaler) common_log.Event {
	e.innerEvent.Array(k, &zeroLogArrayMarshaler{
		marshaler: arrayMarshaler,
	})
	return e
}

func (e *event) Time(k string, t time.Time) common_log.Event {
	e.innerEvent.Time(k, t)
	return e
}

func (e *event) Duration(k string, d time.Duration) common_log.Event {
	e.innerEvent.Dur(k, d)
	return e
}

func (e *event) Err(err error) common_log.Event {
	e.innerEvent.Err(err)
	return e
}

func (e *event) AnErr(k string, err error) common_log.Event {
	e.innerEvent.AnErr(k, err)
	return e
}

func (e *event) Interface(k string, v interface{}) common_log.Event {
	e.innerEvent.Interface(k, v)
	return e
}

func (e *event) Msg(msg string) {
	e.innerEvent.Msg(msg)
}

func (e *event) Send() {
	e.innerEvent.Send()
}

type array struct {
	innerArray *zerolog.Array
}

func newArray(a *zerolog.Array) common_log.Array {
	return &array{
		innerArray: a,
	}
}

func (a *array) Str(val string) common_log.Array {
	a.innerArray.Str(val)
	return a
}

func (a *array) Int(val int) common_log.Array {
	a.innerArray.Int(val)
	return a
}

func (a *array) Object(obj common_log.LogObjectMarshaler) common_log.Array {
	a.innerArray.Object(&zeroLogObjMarshaler{marshaler: obj})
	return a
}

func (a *array) Time(t time.Time) common_log.Array {
	a.innerArray.Time(t)
	return a
}

func (a *array) Err(err error) common_log.Array {
	a.innerArray.Err(err)
	return a
}

type zeroLogObjMarshaler struct {
	marshaler common_log.LogObjectMarshaler
}

func (o *zeroLogObjMarshaler) MarshalZerologObject(e *zerolog.Event) {
	o.marshaler.MarshalLogObject(newEvent(e))
}

type zeroLogArrayMarshaler struct {
	marshaler common_log.LogArrayMarshaler
}

func (a *zeroLogArrayMarshaler) MarshalZerologArray(aa *zerolog.Array) {
	a.marshaler.MarshalLogArray(newArray(aa))
}
