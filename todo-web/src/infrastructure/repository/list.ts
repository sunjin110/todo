

export type Paging = {
    offset: number,
    limit: number,
};

export enum FilterKind {
    Unknown = 0,
    PartialMatch = 1,
    PerfectMatch = 2,
};

export enum SortKind {
    Asc = 0,
    Desc = 0,
};

export type SortField = {
    sort_kind: SortKind;
    priority: number;
};

export type FilterField<T> = {
    value: T;
    kind: FilterKind;
};
