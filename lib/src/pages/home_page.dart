import 'package:flutter/material.dart';
import 'package:re_member/src/configs/palette.dart';
import 'package:re_member/src/modules/communities/communities.dart';
import 'package:re_member/src/modules/discover/discover.dart';
import 'package:re_member/src/modules/leaderboard/leaderboard.dart';
import 'package:re_member/src/pages/profile_page.dart';
import 'package:re_member/src/utils/constants.dart';

/// This is the stateful widget that the main application instantiates.
class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

/// This is the private State class that goes with Center.
class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    // FocusMode(),
    Communities(),
    Discover(),
    LeaderBoard(),
    ProfilePage(isAtRoot: true),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: borderRadiusLarge,
            ),
            margin: const EdgeInsets.all(8.0),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                // BottomNavigationBarItem(
                //   icon: Icon(Icons.do_not_disturb_on_outlined),
                //   label: 'Focus',
                // ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard_rounded),
                  label: 'Dashboard',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Connect',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.leaderboard_rounded),
                  label: 'Leaderboard',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  label: 'Profile',
                ),
              ],
              onTap: _onItemTapped,
              currentIndex: _selectedIndex,
              selectedItemColor: Palette.selectedTab,
              unselectedItemColor: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
