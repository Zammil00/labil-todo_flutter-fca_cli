part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

final class AddTodoEvent extends TodoEvent {
  final String title;

  AddTodoEvent({required this.title});
}

final class GetTodosEvent extends TodoEvent {}

final class UpdateTodoEvent extends TodoEvent {
  final int id;
  final String? title;
  final bool? isChecked;

  UpdateTodoEvent({
    required this.id,
    required this.title,
    required this.isChecked,
  });
}

final class DeleteTodoEvent extends TodoEvent {
  final int id;

  DeleteTodoEvent({required this.id});
}
