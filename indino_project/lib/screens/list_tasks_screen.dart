import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';

class ListTasksScreen extends StatelessWidget {
  const ListTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Access TaskProvider
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Tasks'),
      ),
      body: taskProvider.tasks.isEmpty
          ? const Center(
              child: Text('No tasks available. Add some!'),
            )
          : ListView.builder(
              itemCount: taskProvider.tasks.length,
              itemBuilder: (context, index) {
                final task = taskProvider.tasks[index];

                return Card(
                  child: ListTile(
                    title: Text(task.name),
                    subtitle: Text('Category: ${task.category}'),
                    trailing: Text(task.dueDate),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addTask'); // Adjust as needed
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
