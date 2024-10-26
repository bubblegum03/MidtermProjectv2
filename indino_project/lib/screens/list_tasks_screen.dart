import 'package:flutter/material.dart';

class ListTasksScreen extends StatefulWidget {
  const ListTasksScreen({Key? key}) : super(key: key);

  @override
  _ListTasksScreenState createState() => _ListTasksScreenState();
}

class _ListTasksScreenState extends State<ListTasksScreen> {
  List<String> tasks = [];

  // Method to navigate to AddTaskScreen and retrieve the result
  Future<void> _navigateToAddTaskScreen() async {
    final newTask = await Navigator.pushNamed(context, '/addTask') as String?;
    if (newTask != null && newTask.isNotEmpty) {
      setState(() {
        tasks.add(newTask);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              '𓍯𓂃List of Tasks Here ִֶָ☾.',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tasks[index]),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/taskCompleted',
                      arguments: tasks[index],
                    );
                  },
                );
              },
            ),
          ),
        //   Padding(
        //     padding: const EdgeInsets.all(16.0),
        //     child: ElevatedButton(
        //       onPressed: _navigateToAddTaskScreen,
        //       child: const Text('Add New Task'),
        //     ),
        //   ),
        ],
     ),
    );
  }
}
