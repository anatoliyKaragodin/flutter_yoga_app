import 'package:flutter/material.dart';
import 'package:flutter_yoga_app/data/exercises_per_week.dart';
import 'package:flutter_yoga_app/pages/home_pages/calendar/calendar.dart';
import 'package:flutter_yoga_app/pages/home_pages/profile/profile.dart';
import 'package:flutter_yoga_app/pages/home_pages/yoga/yoga.dart';
import 'package:flutter_yoga_app/utils/my_colors.dart';
import 'package:jiffy/jiffy.dart';

import '../data/minutes_per_date.dart';
import '../utils/dimensions_util.dart';

class HomePageApp extends StatefulWidget {
  static const String route = 'homePageApp';
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
    if(index == 1) {
      mondayMinutes = 0;
      tuesdayMinutes = 0;
      wednesdayMinutes = 0;
      thursdayMinutes = 0;
      fridayMinutes = 0;
      saturdayMinutes = 0;
      sundayMinutes = 0;
      weekMinutes = 0;
      weekWorkout  = 0;
      MinutesPerDay().getDaysMinutes(Jiffy().week);
      ExercisesPerWeek().getExercisesPerWeek(Jiffy().week);
    }
    setState(() {
      _selectedBottomBarIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: MyColors.mainColor,
          title: Center(child: Text(bottomBarLabels[_selectedBottomBarIndex])),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: Center(child: _pages.elementAt(_selectedBottomBarIndex)))
            ],
          ),
        ),

        /// Bottom navigation bar
        bottomNavigationBar: BottomNavigationBar(


          selectedItemColor: MyColors.whiteColor,
          unselectedItemColor: MyColors.fontGreyColor?.withOpacity(0.5),
          // unselectedIconTheme: IconThemeData(size: Dimensions.height10 * 2),
          // selectedIconTheme: IconThemeData(size: Dimensions.height10 * 3),
          selectedFontSize: Dimensions.height10 * 1.8,
          unselectedFontSize: Dimensions.height10 * 1.2,
          backgroundColor: MyColors.mainColor,
          currentIndex: _selectedBottomBarIndex,
          onTap: _onItemTapped,
          items: [
            /// Training page tab
            BottomNavigationBarItem(
                label: bottomBarLabels[0],
                icon: Image.asset('assets/icons/Yoga.png', scale: 2.5,)
            ),

            /// Profile page tab
            BottomNavigationBarItem(
                label: bottomBarLabels[1],
                icon: Image.asset('assets/icons/Calendar.png', scale: 2.5,)),

            /// Settings page tab
            BottomNavigationBarItem(
                label: bottomBarLabels[2],
                icon: Image.asset('assets/icons/Profile.png', scale: 2.5,)),
          ],
        ),
      ),
    );
  }
}
