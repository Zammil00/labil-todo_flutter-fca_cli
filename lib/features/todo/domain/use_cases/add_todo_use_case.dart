import 'package:fpdart/fpdart.dart';
import 'package:labil_todo/core/exceptions/server_exceptions.dart';

import '../repositories/todo_repository.dart';

class AddTodoUseCase {
  final TodoRepository _repository;

  AddTodoUseCase({required TodoRepository repository})
    : _repository = repository;

  Future<Either<ServerExceptions, bool>> call({required String title}) async {
    return _repository.addTodo(title: title);
  }
}
