package repository

type Paging struct {
	Offset uint64
	Limit  uint64
}

type FilterKind string

const (
	// PartialMatch 部分一致
	PartialMatch FilterKind = "partial_match"

	// PerfectMatch 完全一致
	PerfectMatch FilterKind = "perfect_match"
)

type FilterField[T any] struct {
	Value T
	Kind  FilterKind
}

type SortKind string

const (
	Asc  SortKind = "asc"
	Desc SortKind = "desc"
)

func (sk SortKind) Int() int {
	if sk == Asc {
		return 1
	}
	return -1
}

type SortField[T any] struct {
	SortKind SortKind
	Priority uint32 // 優先順位
	// SortFields []T    // 独自の順番でソートしたいときに利用する 使わんだろ
}
