import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:travel_checklist/ui/main_screen.dart';

import '../model/todo.dart';

late final Box<Todo> todos;

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  todos = await Hive.openBox<Todo>('todoList.db');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color.fromRGBO(151, 205, 190, 1.0),
            secondary: const Color.fromRGBO(179, 243, 225, 1.0),
            tertiary: const Color.fromRGBO(113, 154, 142, 1.0),
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
              fontFamily: 'Noto Sans',
              fontSize: 20.0,
            ),
          ),
          useMaterial3: true,
        ),
        home: const MainScreen());
  }
}
