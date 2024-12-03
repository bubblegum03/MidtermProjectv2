class Task {
  final String title;
  final String category;
  final DateTime? dueDate;
  final bool isCompleted;

  Task({
    required this.title,
    this.category = 'General', // Default category is 'General'
    this.dueDate,
    this.isCompleted = false, // Default value is false
  });
}
