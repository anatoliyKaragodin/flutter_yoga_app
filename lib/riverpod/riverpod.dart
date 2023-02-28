import 'package:flutter_yoga_app/utils/library.dart';

final exerciseNumberProvider = StateProvider<int>((ref) {
  return 0;
});

final selectedDifficultyProvider = StateProvider<int>((ref) {
  return 0;
});

final animationPausedProvider = StateProvider<bool>((ref) {
  return false;
});

final completedExerciseProvider = StateProvider<int>((ref) {
  return 0;
});

final completedWorkoutProvider = StateProvider<int>((ref) {
  return 0;
});

final homePageProvider = StateProvider<int>((ref) {
  return 2;
});

final userLevelProvider = StateProvider<int>((ref) {
  return 1;
});

final userExpProvider = StateProvider<int>((ref) {
  return 0;
});

final minutesProvider = StateProvider<int>((ref) {
  return 0;
});