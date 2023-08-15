import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:todoapp/application/error.dart';
import 'package:todoapp/domain/model/todo.dart';
import 'package:todoapp/domain/repository/repository.dart';
import 'package:todoapp/domain/repository/session.dart';
import 'package:todoapp/domain/repository/todo.dart';

abstract class TodoUseCase {
  // UseCaseErrorCode.notFoundSession
  Future<TodoListOutput> list(DateTime txTime, int offset, int limit);

  Future<Todo> get(TodoId id, DateTime txTime);

//
  Future<void> add(DateTime txTime, String title, String description);
}

TodoUseCase newTodoUseCase(
    SessionRepository sessionRepository, TodoRepository todoRepository) {
  return _TodoUseCase(sessionRepository, todoRepository);
}

class _TodoUseCase implements TodoUseCase {
  final SessionRepository _sessionRepository;
  final TodoRepository _todoRepository;
  _TodoUseCase(this._sessionRepository, this._todoRepository);

  @override
  Future<TodoListOutput> list(DateTime txTime, int offset, int limit) async {
    final session = await _sessionRepository.get();
    if (session == null) {
      throw const UseCaseException(
        UseCaseErrorCode.notFoundSession,
      );
    }
    if (session.expireTime.isBefore(txTime)) {
      throw const UseCaseException(UseCaseErrorCode.sessionExpired);
    }

    try {
      final output = await _todoRepository.list(ListInput(
          session: session, paging: Paging(offset: offset, limit: limit)));
      return TodoListOutput(hasNext: output.hasNext, list: output.todos);
    } catch (e) {
      print(e);
      throw const UseCaseException(UseCaseErrorCode.internalError);
    }
  }

  @override
  Future<Todo> get(TodoId id, DateTime txTime) async {
    final session = await _sessionRepository.get();
    if (session == null) {
      throw const UseCaseException(
        UseCaseErrorCode.notFoundSession,
      );
    }
    if (session.expireTime.isBefore(txTime)) {
      throw const UseCaseException(UseCaseErrorCode.sessionExpired);
    }

    try {
      return await _todoRepository.get(session, id);
    } catch (e) {
      throw const UseCaseException(UseCaseErrorCode.internalError);
    }
  }

  @override
  Future<void> add(DateTime txTime, String title, String description) async {
    final session = await _sessionRepository.get();
    if (session == null) {
      throw const UseCaseException(
        UseCaseErrorCode.notFoundSession,
      );
    }
    if (session.expireTime.isBefore(txTime)) {
      throw const UseCaseException(UseCaseErrorCode.sessionExpired);
    }

    try {
      await _todoRepository.create(
          session,
          CreateTodo(
              title: title,
              description: description,
              status: TodoStatus.scheduled));
    } catch (e) {
      print(e);
      throw const UseCaseException(UseCaseErrorCode.internalError);
    }
  }
}

class TodoListOutput {
  final bool hasNext;
  final List<Todo> list;
  TodoListOutput({required this.hasNext, required this.list});
}
