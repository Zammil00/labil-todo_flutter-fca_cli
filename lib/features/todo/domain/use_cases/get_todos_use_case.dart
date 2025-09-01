import 'package:fpdart/fpdart.dart';
import 'package:labil_todo/core/exceptions/server_exceptions.dart';
import 'package:labil_todo/features/todo/domain/entities/todo.dart';

import '../repositories/todo_repository.dart';

class GetTodosUseCase {
  final TodoRepository _repository;

  GetTodosUseCase({required TodoRepository repository})
    : _repository = repository;

  Future<Either<ServerExceptions, List<Todo>>> call() async {
    return _repository.getTodos();
  }
}
