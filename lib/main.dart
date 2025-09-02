import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labil_todo/core/dependencies/dependencies.dart';
import 'package:labil_todo/features/todo/presentation/blocs/todo_bloc.dart';
import 'package:labil_todo/features/todo/presentation/pages/todo_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => sl<TodoBloc>())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Labil Todo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TodoPage(),
    );
  }
}
