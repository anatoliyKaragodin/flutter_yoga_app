import 'package:flutter_yoga_app/utils/library.dart';

import '../../../data/minutes_per_date.dart';
import '../../../riverpod/riverpod.dart';
import '../../../utils/dimensions_util.dart';
import '../../../utils/my_colors.dart';

class ExercisesAndTimeWidget extends ConsumerStatefulWidget {
  const ExercisesAndTimeWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ExercisesAndTimeWidget> createState() => _ExercisesAndTimeWidgetState();
}

class _ExercisesAndTimeWidgetState extends ConsumerState<ExercisesAndTimeWidget> {
  @override
  Widget build(BuildContext context) {
    final week = ref.watch(selectedWeekProvider);
    // final weekMinutes = ref.watch(minutesProvider);
    final weekExercises = ref.watch(completedWorkoutProvider);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Exercises:',
              style: TextStyle(
                  color: MyColors.fontGreyColor,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.height10 * 1.6),
            ),
            Text(
              '$weekExercises',
              style: TextStyle(
                  color: MyColors.fontGreyColor,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.height10 * 1.8),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Time(minutes):',
              style: TextStyle(
                  color: MyColors.fontGreyColor,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.height10 * 1.6),
            ),
            Text(
              '$weekMinutes',
              style: TextStyle(
                  color: MyColors.fontGreyColor,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.height10 * 1.8),
            ),
          ],
        ),
      ],
    );
  }
}
