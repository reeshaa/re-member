import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

/// This is the private State class that goes with home.
class _homeState extends State<home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: focus',
      style: optionStyle,
    ),
    Text(
      'Index 0: discover',
      style: optionStyle,
    ),
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: leaderboard',
      style: optionStyle,
    ),
    Text(
      'Index 2: settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.center_focus_strong),
            label: 'Focus',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard_rounded),
            label: 'Leaderboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
