import 'package:flutter/material.dart';
import 'package:flutter_yoga_app/pages/home_pages/calendar.dart';
import 'package:flutter_yoga_app/pages/home_pages/profile.dart';
import 'package:flutter_yoga_app/pages/home_pages/yoga/yoga.dart';

import '../utils/dimensions_util.dart';

class HomePageApp extends StatefulWidget {
  const HomePageApp({Key? key}) : super(key: key);

  @override
  State<HomePageApp> createState() => _HomePageAppState();
}

class _HomePageAppState extends State<HomePageApp> {
  final List<String> bottomBarLabels = ["Yoga", "Calendar", "Profile"];

  final List<Widget> _pages = <Widget>[
    const YogaPage(),
    const CalendarPage(),
    const ProfilePage(),
  ];

  /// Index
  int _selectedBottomBarIndex = 0;

  final double iconSize = Dimensions.height10 * 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedBottomBarIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(bottomBarLabels[_selectedBottomBarIndex])),),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Center(
                    child: _pages.elementAt(_selectedBottomBarIndex)))
          ],
        ),
      ),

      /// Bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme:
        IconThemeData(size: Dimensions.height10 * 3),
        selectedFontSize: Dimensions.height10 * 1.8,
        unselectedFontSize: Dimensions.height10 * 1.2,
        backgroundColor: Colors.grey[200],
        currentIndex: _selectedBottomBarIndex,
        onTap: _onItemTapped,
        items: [
          /// Training page tab
          BottomNavigationBarItem(
              label: bottomBarLabels[0],
              icon: Icon(
                Icons.access_time_rounded,
                size: iconSize,
              )),

          /// Profile page tab
          BottomNavigationBarItem(
              label: bottomBarLabels[1],
              icon: Icon(Icons.access_time_rounded, size: iconSize)),

          /// Settings page tab
          BottomNavigationBarItem(
              label: bottomBarLabels[2],
              icon: Icon(Icons.person, size: iconSize)),
        ],
      ),
    );
  }
}
