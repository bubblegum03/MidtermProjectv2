import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/add_task_screen.dart';
import 'screens/list_tasks_screen.dart';
import 'screens/task_completed_screen.dart';
import 'screens/about_screen.dart'; // Import the About screen

void main() => runApp(const BottomNavigationBarExampleApp());

class BottomNavigationBarExampleApp extends StatefulWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  _BottomNavigationBarExampleAppState createState() =>
      _BottomNavigationBarExampleAppState();
}

class _BottomNavigationBarExampleAppState
    extends State<BottomNavigationBarExampleApp> {
  bool _isLightTheme = true;

  void _switchTheme(bool isLight) {
    setState(() {
      _isLightTheme = isLight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _isLightTheme ? ThemeData.light() : ThemeData.dark(),
      home: BottomNavigationBarExample(
        switchTheme: _switchTheme,
        isLightTheme: _isLightTheme,
      ),
      routes: {
        '/addTask': (context) => AddTaskScreen(),
        '/taskCompleted': (context) => const TaskCompletedScreen(),
        '/about': (context) => AboutScreen(), // Add route for About screen
      },
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  final Function(bool) switchTheme;
  final bool isLightTheme;

  const BottomNavigationBarExample({
    super.key,
    required this.switchTheme,
    required this.isLightTheme,
  });

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const ListTasksScreen(),
     AddTaskScreen(), // Assuming you have this screen defined
     const TaskCompletedScreen(), // Assuming you have this screen defined
     AboutScreen(), // Add AboutScreen to options
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update selected index

      if (_selectedIndex == 0) {
        // Show ListTasksScreen
      } else if (_selectedIndex == 1) {
        Navigator.pushNamed(context, '/addTask');
      } else if (_selectedIndex == 2) {
        Navigator.pushNamed(context, '/taskCompleted', arguments: "Sample Task");
      } else if (_selectedIndex == 3) { // Handle About screen tap
        Navigator.pushNamed(context, '/about');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 233, 113, 153),
        title: const Text(
          '༘⋆🌷Task Manager💭₊˚ෆ',
          style: TextStyle(color: Color.fromARGB(255, 5, 119, 9)),
        ),
        actions: [
          Switch(
            value: widget.isLightTheme,
            onChanged: widget.switchTheme,
            activeColor: const Color.fromRGBO(233, 30, 99, 1),
            inactiveThumbColor: const Color.fromARGB(255, 38, 116, 38),
          ),
        ],
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 9, 97, 21)),
      ),
      body: Container(
        color: widget.isLightTheme
            ? const Color.fromARGB(255, 85, 160, 91)
            : const Color.fromARGB(255, 228, 112, 112),
        child: Center(
          child: _widgetOptions[_selectedIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 226, 105, 145),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_task),
            label: 'Add Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: 'Completed Tasks',
          ),
          BottomNavigationBarItem( // New item for About screen
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFFDD7D9A),
        unselectedItemColor: const Color.fromARGB(255, 5, 119, 9),
        onTap: _onItemTapped,
      ),
    );
  }
}