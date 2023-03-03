import 'package:flutter_yoga_app/utils/library.dart';
import 'package:jiffy/jiffy.dart';

int mondayMinutes = 0;
int tuesdayMinutes = 0;
int wednesdayMinutes = 0;
int thursdayMinutes = 0;
int fridayMinutes = 0;
int saturdayMinutes = 0;
int sundayMinutes = 0;
int weekMinutes = 0;
int weekWorkout = 0;

class MinutesPerDay {
  void getDaysMinutes(int week) async {
    final prefs = await SharedPreferences.getInstance();
    var keys = prefs.getKeys();
    for (var data in keys) {
      if (data.startsWith('20')) {
        print('GET DAYS MINUTES');
        int minutes = prefs.getInt(data) ?? 0;
        if (Jiffy(data).week == week) {
          if (Jiffy(data).format('EEEE') == 'Monday') {
            mondayMinutes = minutes;
            weekMinutes += mondayMinutes;
            print(mondayMinutes);
            print('got it!');
          } else if (Jiffy(data).format('EEEE') == 'Tuesday') {
            tuesdayMinutes = minutes;
            weekMinutes += tuesdayMinutes;
          } else if (Jiffy(data).format('EEEE') == 'Wednesday') {
            wednesdayMinutes = minutes;
            weekMinutes += wednesdayMinutes;
            print(wednesdayMinutes);
            print('got it!');
          } else if (Jiffy(data).format('EEEE') == 'Thursday') {
            thursdayMinutes = minutes;
            weekMinutes += thursdayMinutes;
            print(thursdayMinutes);
            print('got it!');
          } else if (Jiffy(data).format('EEEE') == 'Friday') {
            fridayMinutes = minutes;
            weekMinutes += fridayMinutes;
          } else if (Jiffy(data).format('EEEE') == 'Saturday') {
            saturdayMinutes = minutes;
            weekMinutes += saturdayMinutes;
          } else if (Jiffy(data).format('EEEE') == 'Sunday') {
            sundayMinutes = minutes;
            weekMinutes += sundayMinutes;
          }
        }
      }
    }
  }
}
