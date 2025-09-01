import 'package:fpdart/fpdart.dart';
import 'package:labil_todo/core/exceptions/server_exceptions.dart';

import '../repositories/todo_repository.dart';

class DeleteTodoUseCase {
  final TodoRepository _repository;

  DeleteTodoUseCase({required TodoRepository repository})
    : _repository = repository;

  Future<Either<ServerExceptions, bool>> call({required int id}) async {
    return _repository.deleteTodo(id: id);
  }
}
