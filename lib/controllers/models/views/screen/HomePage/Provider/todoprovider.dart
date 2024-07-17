// lib/providers/todo_provider.dart
import 'package:flutter/material.dart';
import 'package:todo/controllers/models/views/screen/HomePage/todomodels.dart';

class TodoProvider with ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void updateTodo(Todo todo) {
    final index = _todos.indexWhere((item) => item.id == todo.id);
    if (index != -1) {
      _todos[index] = todo;
      notifyListeners();
    }
  }

  void deleteTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}
