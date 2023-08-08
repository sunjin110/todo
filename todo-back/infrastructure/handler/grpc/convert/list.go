package convert

import (
	"todo-back/domain/repository"
	"todo-back/infrastructure/handler/grpc/proto_go_gen/list"
)

func toRepositoryPaging(paging *list.Paging) *repository.Paging {
	if paging == nil {
		return nil
	}

	return &repository.Paging{
		Offset: uint64(paging.Offset),
		Limit:  uint64(paging.Limit),
	}
}

func toRepositorySortField(sort *list.SortField) *repository.SortField {
	if sort == nil {
		return nil
	}

	return &repository.SortField{
		SortKind: toRepositorySortKind(sort.SortKind),
		Priority: uint32(sort.Priority),
	}
}

func toRepositorySortKind(sortKind list.SortKind) repository.SortKind {
	switch sortKind {
	case list.SortKind_FilterAsc:
		return repository.Asc
	case list.SortKind_FilterDesc:
		return repository.Desc
	default:
		return repository.Asc
	}
}

func toRepositoryFilterField[T any](filter *T, kind *list.FilterKind) *repository.FilterField[T] {
	if filter == nil {
		return nil
	}

	return &repository.FilterField[T]{
		Value: *filter,
		Kind:  toRepositoryFieldKind(kind),
	}
}

func toRepositoryFieldKind(kind *list.FilterKind) repository.FilterKind {
	if kind == nil {
		return repository.PerfectMatch
	}

	switch *kind {
	case list.FilterKind_FilterPartialMatch:
		return repository.PartialMatch
	case list.FilterKind_FilterPerfectMatch:
		return repository.PerfectMatch
	default:
		return repository.PerfectMatch
	}
}
