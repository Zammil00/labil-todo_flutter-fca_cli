import 'package:fpdart/fpdart.dart';
import 'package:labil_todo/core/exceptions/server_exceptions.dart';
import 'package:labil_todo/features/todo/data/data_sources/todo_remote_data_source.dart';
import 'package:labil_todo/features/todo/domain/entities/todo.dart';
import '../../domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDataSource _remoteDataSource;

  TodoRepositoryImpl({required TodoRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<ServerExceptions, bool>> addTodo({
    required String title,
  }) async {
    return run(() async {
      await _remoteDataSource.addTodo(title: title);
      return right(true);
    });
  }

  @override
  Future<Either<ServerExceptions, bool>> deleteTodo({required int id}) async {
    return run(() async {
      await _remoteDataSource.deleteTodo(id: id);
      return right(true);
    });
  }

  @override
  Future<Either<ServerExceptions, List<Todo>>> getTodos() {
    return run(() async {
      final todos = await _remoteDataSource.getTodos();
      return right(todos);
    });
  }

  @override
  Future<Either<ServerExceptions, bool>> updateTodo({
    required int id,
    String? title,
    bool? isChecked,
  }) {
    return run(() async {
      await _remoteDataSource.updateTodo(
        id: id,
        title: title,
        isChecked: isChecked,
      );
      return right(true);
    });
  }

  Future<Either<ServerExceptions, T>> run<T>(
    Future<Either<ServerExceptions, T>> Function() function,
  ) async {
    try {
      return await function();
    } on ServerExceptions catch (error) {
      return left(error);
    }
  }
}
