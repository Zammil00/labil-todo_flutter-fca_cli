import 'package:labil_todo/features/todo/data/models/todo_model.dart';

abstract interface class TodoRemoteDataSource {
  Future<void> addTodo({required String title});
  Future<void> deleteTodo({required int id});
  Future<List<TodoModel>> getTodos();
  Future<void> updateTodo({required int id, String? title, bool? isChecked});
}
