import 'package:flutter/material.dart'; 
import 'package:indino_project/providers/task_provider.dart';


class TaskCompletedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retrieve the Task object passed as an argument
    final task = ModalRoute.of(context)?.settings.arguments as Task;

    return Scaffold(
      appBar: AppBar(title: Text('Task Completed')),
      body: Center(
        child: Text('Task "${task.name}" is marked as complete!', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
