package txtime

import (
	"context"
	"time"
)

type key string

const ctxIDKey key = "txtime"

func GetTxTime(ctx context.Context) time.Time {
	txTime, ok := ctx.Value(ctxIDKey).(time.Time)
	if !ok {
		return time.Now()
	}
	return txTime
}

func ContextWithTxTime(ctx context.Context, txTime time.Time) context.Context {
	return context.WithValue(ctx, ctxIDKey, txTime)
}
