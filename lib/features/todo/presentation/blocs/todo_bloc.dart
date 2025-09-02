import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labil_todo/features/todo/domain/use_cases/add_todo_use_case.dart';
import 'package:labil_todo/features/todo/domain/use_cases/delete_todo_use_case.dart';
import 'package:labil_todo/features/todo/domain/use_cases/get_todos_use_case.dart';
import 'package:labil_todo/features/todo/domain/use_cases/update_todo_use_case.dart';

part 'todo_state.dart';
part 'todo_event.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final AddTodoUseCase _addTodoUseCase;
  final DeleteTodoUseCase _deleteTodoUseCase;
  final GetTodosUseCase _getTodosUseCase;
  final UpdateTodoUseCase _updateTodoUseCase;

  TodoBloc({
    required AddTodoUseCase addTodoUseCase,
    required DeleteTodoUseCase deleteTodoUseCase,
    required GetTodosUseCase getTodosUseCase,
    required UpdateTodoUseCase updateTodoUseCase,
  }) : _addTodoUseCase = addTodoUseCase,
       _deleteTodoUseCase = deleteTodoUseCase,
       _getTodosUseCase = getTodosUseCase,
       _updateTodoUseCase = updateTodoUseCase,
       super(InitialState()) {
    on<AddTodoEvent>(_onAddTodo);
    on<GetTodosEvent>(_onGetTodos);
    on<UpdateTodoEvent>(_onUpdateTodo);
    on<DeleteTodoEvent>(_onDeleteTodo);
  }

  FutureOr<void> _onAddTodo(AddTodoEvent event, Emitter<TodoState> emit) async {
    // emit(LoadingState());
    final result = await _addTodoUseCase(title: event.title);
    result.fold(
      (error) => emit(FailureState(error.message)),
      (data) => add(GetTodosEvent()),
    );
  }

  FutureOr<void> _onGetTodos(
    GetTodosEvent event,
    Emitter<TodoState> emit,
  ) async {
    // emit(LoadingState());
    final result = await _getTodosUseCase();
    result.fold(
      (error) => emit(FailureState(error.message)),
      (data) => emit(SuccessState(data)),
    );
  }

  FutureOr<void> _onUpdateTodo(
    UpdateTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    // emit(LoadingState());
    final result = await _updateTodoUseCase(
      id: event.id,
      title: event.title,
      isChecked: event.isChecked,
    );
    result.fold(
      (error) => emit(FailureState(error.message)),
      (data) => add(GetTodosEvent()),
    );
  }

  FutureOr<void> _onDeleteTodo(
    DeleteTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    // emit(LoadingState());
    final result = await _deleteTodoUseCase(id: event.id);
    result.fold(
      (error) => emit(FailureState(error.message)),
      (data) => add(GetTodosEvent()),
    );
  }
}
