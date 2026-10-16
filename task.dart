class Task {
  final String id;
  final String title;
  final String deadline;
  final String difficulty; // Easy, Medium, Hard
  final String resourceType; // Notes, Video, Quiz
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.deadline,
    required this.difficulty,
    required this.resourceType,
    this.isCompleted = false,
  });
}