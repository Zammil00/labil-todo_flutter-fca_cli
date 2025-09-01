import 'package:labil_todo/features/todo/data/models/todo_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'todo_remote_data_source.dart';

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  final SupabaseClient _supabaseClient;

  TodoRemoteDataSourceImpl({required SupabaseClient supabaseClient})
    : _supabaseClient = supabaseClient;

  @override
  Future<void> addTodo({required String title}) async {
    return _supabaseClient.from('todos').insert({'title': title});
  }

  @override
  Future<void> deleteTodo({required int id}) async {
    return _supabaseClient.from('todos').delete().eq('id', id);
  }

  @override
  Future<List<TodoModel>> getTodos() async {
    final response = await _supabaseClient
        .from('todos')
        .select()
        .order('is_checked', ascending: true)
        .order('title', ascending: true);

    return TodoModel.fromJsonList(response);
  }

  @override
  Future<void> updateTodo({required int id, String? title, bool? isChecked}) {
    return _supabaseClient
        .from('todos')
        .update({
          if (title != null) 'title': title,
          if (isChecked != null) 'is_checked': isChecked,
        })
        .eq('id', id);
  }
}
