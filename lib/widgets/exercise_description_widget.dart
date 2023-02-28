import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yoga_app/utils/my_colors.dart';

import '../data/exercises.dart';
import '../models/exercise_model.dart';
import '../riverpod/riverpod.dart';
import '../utils/dimensions_util.dart';


class ExerciseDescriptionWidget extends ConsumerStatefulWidget {
  final ExerciseModel exercise;

  const ExerciseDescriptionWidget({
    Key? key,
    required this.exercise,
  }) : super(key: key);

  @override
  ConsumerState<ExerciseDescriptionWidget> createState() => _ExerciseDescriptionWidgetState();
}

class _ExerciseDescriptionWidgetState extends ConsumerState<ExerciseDescriptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          // bottom: Dimensions.height10,
          left: Dimensions.width10 * 1.5,
          right: Dimensions.width10 * 1.5),
      child: Container(
        child: Column(
          children: [
          Image.asset(Exercises().listOfDifficultyExercises[ref.read(selectedDifficultyProvider)][ref.read(exerciseNumberProvider)].image),
            Text(
              Exercises()
                  .listOfDifficultyExercises[ref.read(selectedDifficultyProvider)][ref.read(exerciseNumberProvider)]
                  .label,
              style: TextStyle(fontSize: Dimensions.height10*2, color: MyColors.fontGreyColor, fontWeight: FontWeight.bold),
            ),
            // Text('duration ${exercise.durationIsSec.toString()} seconds'),
            SizedBox(
              height: Dimensions.height10,
            ),
            Text(Exercises()
                .listOfDifficultyExercises[ref.read(selectedDifficultyProvider)][ref.read(exerciseNumberProvider)]
                .description),
          ],
        ),
      ),
    );
  }
}
