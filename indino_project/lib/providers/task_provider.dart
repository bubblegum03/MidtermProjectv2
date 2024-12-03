import 'package:flutter/material.dart';

class Task {
  final String name;
  final String dueDate;
  final String category; // New field for categories

  Task({
    required this.name,
    required this.dueDate,
    required this.category, // Include category in the constructor
  });
}

// Define TaskProvider class
class TaskProvider with ChangeNotifier {
  // List to store tasks
  List<Task> _tasks = [];

  // Getter to fetch all tasks
  List<Task> get tasks => _tasks;

  // Getter to fetch tasks by category
  Map<String, List<Task>> get tasksByCategory {
    Map<String, List<Task>> categorizedTasks = {};
    for (var task in _tasks) {
      categorizedTasks.putIfAbsent(task.category, () => []).add(task);
    }
    return categorizedTasks;
  }

  // Method to add a task
  void addTask(Task task) {
    _tasks.add(task); // Add the task to the list
    notifyListeners(); // Notify listeners to update the UI
  }

  // Method to remove a task
  void removeTask(Task task) {
    _tasks.remove(task); // Remove the task from the list
    notifyListeners(); // Notify listeners to update the UI
  }
}
