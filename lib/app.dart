import 'package:flutter/material.dart';
import 'package:data_persist/pages/todo_list_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      home: TodoListPage()
    );
  }
}
