import 'package:flutter/foundation.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [
    Task(id: '1', title: 'DSA - Arrays', deadline: '20 Oct 2026', difficulty: 'Medium', resourceType: 'Notes', isCompleted: false),
    Task(id: '2', title: 'Web Tech', deadline: '20 Oct 2026', difficulty: 'Easy', resourceType: 'Video', isCompleted: false),
    Task(id: '3', title: 'DBMS Quiz', deadline: '20 Oct 2026', difficulty: 'Hard', resourceType: 'Quiz', isCompleted: false),
  ];

  List<Task> get tasks => _tasks;

  void addTask(String title, String deadline, String difficulty, String resourceType) {
    final newTask = Task(
      id: DateTime.now().toIso8601String(),
      title: title,
      deadline: deadline,
      difficulty: difficulty,
      resourceType: resourceType,
    );
    _tasks.add(newTask);
    notifyListeners();
  }

  void toggleTaskStatus(String id) {
    final task = _tasks.firstWhere((t) => t.id == id);
    task.isCompleted = !task.isCompleted;
    notifyListeners();
  }
}