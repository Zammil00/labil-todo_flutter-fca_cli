import 'package:get_it/get_it.dart';
import 'package:labil_todo/features/todo/data/data_sources/todo_remote_data_source.dart';
import 'package:labil_todo/features/todo/data/data_sources/todo_remote_data_source_impl.dart';
import 'package:labil_todo/features/todo/data/repositories/todo_repository_impl.dart';
import 'package:labil_todo/features/todo/domain/repositories/todo_repository.dart';
import 'package:labil_todo/features/todo/domain/use_cases/add_todo_use_case.dart';
import 'package:labil_todo/features/todo/domain/use_cases/delete_todo_use_case.dart';
import 'package:labil_todo/features/todo/domain/use_cases/get_todos_use_case.dart';
import 'package:labil_todo/features/todo/domain/use_cases/update_todo_use_case.dart';
import 'package:labil_todo/features/todo/presentation/blocs/todo_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'dependencies_main.dart';