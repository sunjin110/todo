class Paging {
  final int offset;
  final int limit;
  Paging({required this.offset, required this.limit});
}

class FilterField<T> {
  final T value;
  final FilterKind kind;
  FilterField({required this.value, required this.kind});
}

enum FilterKind {
  partialMatch,
  perfectMatch,
}

class SortField {
  final SortKind sortKind;
  final int priority;
  SortField({required this.sortKind, required this.priority});
}

enum SortKind {
  asc,
  desc,
}
