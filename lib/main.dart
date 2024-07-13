import 'package:flutter/material.dart';
import 'package:todoey_flutter/screens/task_add.dart';
import 'package:todoey_flutter/screens/task_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: TaskScreen.id,
      routes: {
        TaskScreen.id: (context) => const TaskScreen(),
        TaskAdd.id: (context) => const TaskAdd(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
