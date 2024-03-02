import 'package:flutter/material.dart';

class ToDo with ChangeNotifier {
  List<ToDoData> _todos = [];

  List<ToDoData> get todos => _todos;

  void addToDo(String title, String description) {
    final newToDo = ToDoData(title: title, description: description);
    _todos.add(newToDo);
    notifyListeners();
  }
}

class ToDoData {
  final String title;
  final String description;

  ToDoData({required this.title, required this.description});
}
