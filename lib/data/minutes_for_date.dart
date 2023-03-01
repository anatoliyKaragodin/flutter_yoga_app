import 'package:flutter_yoga_app/utils/library.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

import '../utils/week_number.dart';

int mondayMinutes = 0;
int tuesdayMinutes = 0;
int wednesdayMinutes = 0;
int thursdayMinutes = 0;
int fridayMinutes = 0;
int saturdayMinutes = 0;
int sundayMinutes = 0;

class MinutesPerDay {
  void getDaysMinutes() async {
    final week = WeekNumber().weekNumber;
    final prefs = await SharedPreferences.getInstance();
    var keys = prefs.getKeys();
    for (var data in keys) {
      if (data.startsWith('20')) {
        int minutes = prefs.getInt(data) ?? 0;
        if (Jiffy(data).week == week) {
          if (Jiffy(data).format('EEEE') == 'Monday') {
            mondayMinutes = minutes;
            print(mondayMinutes);
            print('got it!');
          } else if (Jiffy(data).format('EEEE') == 'Tuesday') {
            tuesdayMinutes = minutes;
          } else if (Jiffy(data).format('EEEE') == 'Wednesday') {
            wednesdayMinutes = minutes;
          } else if (Jiffy(data).format('EEEE') == 'Thursday') {
            thursdayMinutes = minutes;
          } else if (Jiffy(data).format('EEEE') == 'Friday') {
            fridayMinutes = minutes;
          } else if (Jiffy(data).format('EEEE') == 'Saturday') {
            saturdayMinutes = minutes;
          } else if (Jiffy(data).format('EEEE') == 'Sunday') {
            sundayMinutes = minutes;
          }
        }
      }
    }
  }
}
