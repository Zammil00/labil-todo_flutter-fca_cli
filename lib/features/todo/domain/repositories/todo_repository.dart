import 'package:fpdart/fpdart.dart';
import 'package:labil_todo/core/exceptions/server_exceptions.dart';
// ignore: unused_import
import 'package:labil_todo/features/todo/data/models/todo_model.dart';
import 'package:labil_todo/features/todo/domain/entities/todo.dart';

abstract interface class TodoRepository {
  Future<Either<ServerExceptions, bool>> addTodo({required String title});
  Future<Either<ServerExceptions, bool>> deleteTodo({required int id});
  Future<Either<ServerExceptions, List<Todo>>> getTodos();
  Future<Either<ServerExceptions, bool>> updateTodo({
    required int id,
    String? title,
    bool? isChecked,
  });
}
