import '../../domain/entities/todo.dart';

class TodoModel extends Todo {
  TodoModel({
    required super.id,
    required super.title,
    required super.isChechked,
  });


  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'] as int,
      title: json['title'] as String,
      isChechked: json['is_checked'] as bool,
    );
  } 

  static List<TodoModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => TodoModel.fromJson(json as Map<String, dynamic>))
        .toList();
  } 
}
