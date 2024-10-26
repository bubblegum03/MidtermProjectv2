import 'package:flutter/material.dart';

class TaskCompletedScreen extends StatelessWidget {
  const TaskCompletedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final task = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(title: const Text('⋆˚࿔ Task Completed 𝜗𝜚˚⋆',
       style: TextStyle(color: Color.fromARGB(255, 5, 119, 9)),)),
      body: Center(
        child: Text(
          task != null
              ? 'No completed task yet :('
              : 'No task information available.',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
