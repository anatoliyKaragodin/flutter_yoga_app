import 'package:flutter_yoga_app/data/minutes_per_date.dart';
import 'package:flutter_yoga_app/utils/library.dart';

class ExercisesPerWeek {
  getExercisesPerWeek(int week) async {
    final prefs = await SharedPreferences.getInstance();
    var keys = prefs.getKeys();
    for (var key in keys) {
      if (key.startsWith('week$week')) {
        weekWorkout = prefs.getInt(key) ?? 0;
      }
    }
  }
}
