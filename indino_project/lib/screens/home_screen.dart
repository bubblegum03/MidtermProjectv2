import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // final Function(bool) switchTheme;
  // final bool isLightTheme;

  // HomeScreen({required this.switchTheme, required this.isLightTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TASK MANAGER'),
        
        // actions: [
        //   Switch(
        //     value: isLightTheme,
        //     onChanged: switchTheme,
        //   ),
        // ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ElevatedButton(
            //   onPressed: () => Navigator.pushNamed(context, '/addTask'),
            //   child: Text('Add a Task'),
            // ),
            // ElevatedButton(
            //   onPressed: () => Navigator.pushNamed(context, '/listTasks'),
            //   child: Text('List of Tasks'),
            // ),
          ],
        ),
      ),
    );
  }
}
