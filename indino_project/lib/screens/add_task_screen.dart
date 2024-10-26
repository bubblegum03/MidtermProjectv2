import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AddTaskScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final taskController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Add New Task──★ ˙🧷 ̟ !! ', 
       style: TextStyle(color: Color.fromARGB(255, 5, 119, 9)), )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: taskController,
              decoration: const InputDecoration(labelText: 'Task Name'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (taskController.text.isNotEmpty) {
                  Navigator.pop(context, taskController.text);
                }
              },
              child: const Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
