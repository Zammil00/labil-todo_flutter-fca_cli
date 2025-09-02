import 'package:flutter/material.dart';
import 'package:labil_todo/core/dependencies/dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Labil Todo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: const Text('Labil Todo')),
        body: Center(child: const Text('Welcome to Labil Todo!')),
      ),
    );
  }
}
