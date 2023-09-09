import { Todo, TodoId, TodoStatus } from "../../../domain/model/todo";
import { TodoFilter, TodoSort } from "../../../domain/repository/todo";
import * as grpc from "../../grpc/proto_ts_gen/todo/todo_pb";
import { toGrpcFilterKind, toGrpcSortField } from "./list";
import { toUserId } from "./user";

export function toTodoStatus(status: grpc.Status): TodoStatus {
    switch(status) {
        case grpc.Status.DONE:
            return TodoStatus.Done;
        case grpc.Status.DRAFT:
            return TodoStatus.Draft;
        case grpc.Status.SCHEDULED:
            return TodoStatus.Scheduled;
        default:
            return TodoStatus.Done;
    }
}

export function toGrpcTodoStatus(status: TodoStatus): grpc.Status {
    switch (status) {
        case TodoStatus.Done:
            return grpc.Status.DONE;
        case TodoStatus.Draft:
            return grpc.Status.DRAFT;
        case TodoStatus.Scheduled:
            return grpc.Status.SCHEDULED;
    }
}

export function toTodoId(id: grpc.TodoId): TodoId {
    return id.getId();
}

export function toTodo(grpcTodo: grpc.Todo): Todo {
    return {
        id: toTodoId(grpcTodo.getId()!),
        title: grpcTodo.getTitle(),
        description: grpcTodo.getDescription(),
        status: toTodoStatus(grpcTodo.getStatus()),
        user_id: toUserId(grpcTodo.getUserId()!),
        create_time: grpcTodo.getCreateTime()!.toDate(),
        done_time: grpcTodo.getDoneTime()?.toDate(),
    };
}

export function toTodos(grpcTodos: Array<grpc.Todo>): Todo[] {
    return grpcTodos.map(todo => toTodo(todo));
}

export function toGrpcTodoId(id: string): grpc.TodoId {
    const grpcTodoId = new grpc.TodoId();
    grpcTodoId.setId(id);
    return grpcTodoId;
}

export function toGrpcTodoFilter(filter: TodoFilter): grpc.TodoFilter {
    const grpcTodoFilter = new grpc.TodoFilter();

    if (filter.id) {
        grpcTodoFilter.setId(toGrpcTodoId(filter.id));
    }

    if (filter.title) {
        grpcTodoFilter.setTitle(filter.title.value);
        grpcTodoFilter.setTitleFilterKind(toGrpcFilterKind(filter.title.kind));
    }

    if (filter.description) {
        grpcTodoFilter.setDescription(filter.description.value);
        grpcTodoFilter.setDescriptionFilterKind(toGrpcFilterKind(filter.description.kind));
    }

    if (filter.status) {
        grpcTodoFilter.setStatus(toGrpcTodoStatus(filter.status));
    }

    return grpcTodoFilter;
}

export function toGrpcTodoSort(sort: TodoSort): grpc.TodoSort {
    const grpcTodoSort = new grpc.TodoSort();

    if (sort.create_time) {
        grpcTodoSort.setCreateTime(toGrpcSortField(sort.create_time));
    }

    if (sort.done_time) {
        grpcTodoSort.setDoneTime(toGrpcSortField(sort.done_time));
    }

    return grpcTodoSort;
}
