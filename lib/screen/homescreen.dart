import 'package:flutter/material.dart';
import '../weather/screen/weather.dart';
import '../todo/screen/todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1;
  List<Widget> pages = const [
    Weather(),
    Todo(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pages[_currentIndex],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        surfaceTintColor: Theme.of(context).colorScheme.primaryContainer,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: _currentIndex,
        onDestinationSelected: (int newindex) {
          setState(() {
            _currentIndex = newindex;
          });
        },
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.cloud),
            icon: Icon(Icons.cloud_outlined),
            label: 'Weather',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.check_box),
            icon: Icon(Icons.check_box_outlined),
            label: 'Life',
          ),
        ],
      ),
    );
  }
}
