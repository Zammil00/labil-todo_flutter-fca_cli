import '../../domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  const TodoRepositoryImpl();

  Future<T> _run<T>(Future<T> Function() function) async {
    try {
      return await function();
    } catch (e) {
      throw e;
    }
  }
}
