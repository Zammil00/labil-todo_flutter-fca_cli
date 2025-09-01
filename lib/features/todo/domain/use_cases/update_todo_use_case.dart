import 'package:fpdart/fpdart.dart';
import 'package:labil_todo/core/exceptions/server_exceptions.dart';

import '../repositories/todo_repository.dart';

class UpdateTodoUseCase {
  final TodoRepository _repository;

  UpdateTodoUseCase({required TodoRepository repository})
    : _repository = repository;

  Future<Either<ServerExceptions, bool>> call({
    required int id,
    String? title,
    bool? isChecked,
  }) async {
    return _repository.updateTodo(id: id, title: title, isChecked: isChecked);
  }
}
