part of 'dependencies.dart';

final sl = GetIt.instance;

initializeDependencies() async {
  await Supabase.initialize(
    url: 'https://jybmiddelvqkejxfatyp.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp5Ym1pZGRlbHZxa2VqeGZhdHlwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTY3MzYxMjAsImV4cCI6MjA3MjMxMjEyMH0.41XNQpAfTvu8YBnLtNRbk18EpZG5BojxiPhqhV7pCqs',
  );

  sl.registerLazySingleton(() => Supabase.instance.client);

  _todo();
}

_todo() {
  // DATA SOURCES
  sl
    ..registerLazySingleton<TodoRemoteDataSource>(
      () => TodoRemoteDataSourceImpl(supabaseClient: sl()),
    )
    //   REPOSITORIES
    ..registerLazySingleton<TodoRepository>(
      () => TodoRepositoryImpl(remoteDataSource: sl()),
    )
    ..registerLazySingleton(() => AddTodoUseCase(repository: sl()))
    ..registerLazySingleton(() => DeleteTodoUseCase(repository: sl()))
    ..registerLazySingleton(() => GetTodosUseCase(repository: sl()))
    ..registerLazySingleton(() => UpdateTodoUseCase(repository: sl()));
}
