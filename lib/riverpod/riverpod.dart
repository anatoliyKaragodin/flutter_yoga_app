import 'package:flutter_yoga_app/utils/library.dart';

final exerciseNumberProvider = StateProvider<int>((ref) {
  return 0;
});

final selectedDayProvider = StateProvider<int>((ref) {
  return 0;
});

final animationPausedProvider = StateProvider<bool>((ref) {
  return false;
});

final completedExerciseProvider = StateProvider<int>((ref) {
  return 0;
});

final homePageProvider = StateProvider<int>((ref) {
  return 2;
});