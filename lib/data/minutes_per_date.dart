import 'package:flutter_yoga_app/main.dart';
import 'package:flutter_yoga_app/riverpod/riverpod.dart';
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
int weekMinutes = 0;

class MinutesPerDay {
  void getDaysMinutes(int week) async {
    // final week = container.read(selectedWeekProvider);
    // final week = WeekNumber().weekNumber;
    final prefs = await SharedPreferences.getInstance();
    var keys = prefs.getKeys();
    for (var data in keys) {
      if (data.startsWith('20')) {
        print('GET DAYS MINUTES');
        int minutes = prefs.getInt(data) ?? 0;
        if (Jiffy(data).week == week) {
          if (Jiffy(data).format('EEEE') == 'Monday') {
            // container
            //     .read(mondayMinutesProvider.notifier)
            //     .update((state) => minutes);
            mondayMinutes = minutes;
            weekMinutes += minutes;
            print(mondayMinutes);
            print('got it!');
          } else if (Jiffy(data).format('EEEE') == 'Tuesday') {
            // container
            //     .read(tuesdayMinutesProvider.notifier)
            //     .update((state) => minutes);
            tuesdayMinutes = minutes;
            weekMinutes += minutes;
          } else if (Jiffy(data).format('EEEE') == 'Wednesday') {
            // container
            //     .read(wednesdayMinutesProvider.notifier)
            //     .update((state) => minutes);
            wednesdayMinutes = minutes;
            weekMinutes += minutes;
            print(wednesdayMinutes);
            print('got it!');
          } else if (Jiffy(data).format('EEEE') == 'Thursday') {
            // container
            //     .read(thursdayMinutesProvider.notifier)
            //     .update((state) => minutes);
            thursdayMinutes = minutes;
            weekMinutes += minutes;
            print(thursdayMinutes);
            print('got it!');
          } else if (Jiffy(data).format('EEEE') == 'Friday') {
            // container
            //     .read(fridayMinutesProvider.notifier)
            //     .update((state) => minutes);
            fridayMinutes = minutes;
            weekMinutes += minutes;
          } else if (Jiffy(data).format('EEEE') == 'Saturday') {
            // container
            //     .read(saturdayMinutesProvider.notifier)
            //     .update((state) => minutes);
            saturdayMinutes = minutes;
            weekMinutes += minutes;
          } else if (Jiffy(data).format('EEEE') == 'Sunday') {
            // container
            //     .read(sundayMinutesProvider.notifier)
            //     .update((state) => minutes);
            sundayMinutes = minutes;
            weekMinutes += minutes;
          }

        }
      }
    }
  }
}
