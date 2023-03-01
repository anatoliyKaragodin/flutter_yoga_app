import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

import '../utils/week_number.dart';

int mondayMinutes = 10;
int tuesdayMinutes = 15;
int wednesdayMinutes = 20;
int thursdayMinutes = 30;
int fridayMinutes = 40;
int saturdayMinutes = 50;
int sundayMinutes = 60;

class MinutesForDay {

  void getDaysMinutes() {
    final date = '2023-03-01';
    print(Jiffy(date).format('EEEE'));
    final week = WeekNumber().weekNumber;
    print('WEEK: $week');
    print('MY WEEK: ${Jiffy(date).week}');
    if (Jiffy(date).week == week) {
      if (Jiffy(date).format('EEEE') == 'Wednesday') {
        wednesdayMinutes = 60;
        print(wednesdayMinutes);
        print('got it!');
      }
    }
  }
}
