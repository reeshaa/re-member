import 'package:flutter/material.dart';
import 'package:re_member/src/modules/communities/communities.dart';
import 'package:re_member/src/modules/discover/discover.dart';
import 'package:re_member/src/modules/focus_mode/focus.dart';
import 'package:re_member/src/modules/leaderboard/leaderboard.dart';
import 'package:re_member/src/modules/settings/settings.dart';
import 'package:re_member/src/utils/border_radii.dart';

/// This is the stateful widget that the main application instantiates.
class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

/// This is the private State class that goes with Center.
class _HomeState extends State<Home> {
  int _selectedIndex = 2;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    FocusMode(),
    Discover(),
    Communities(),
    LeaderBoard(),
    SettingsPage(),
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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadiusLarge,
        ),
        margin: const EdgeInsets.all(8.0),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.center_focus_strong),
              label: 'Focus',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Discover',
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
          unselectedItemColor: Colors.grey[600],
          unselectedLabelStyle: TextStyle(
            color: Colors.grey[600],
          ),
          // showUnselectedLabels: true,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
