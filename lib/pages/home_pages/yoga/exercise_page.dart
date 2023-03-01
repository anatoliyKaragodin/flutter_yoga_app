import 'dart:async';

import 'package:flutter_yoga_app/pages/home_page_app.dart';
import 'package:flutter_yoga_app/utils/library.dart';
import 'package:flutter_yoga_app/utils/my_colors.dart';

import 'dart:math' as math;

import '../../../data/exercises.dart';
import '../../../data/minutes_per_date.dart';
import '../../../riverpod/riverpod.dart';
import '../../../utils/dimensions_util.dart';
import 'exercise_description_widget.dart';

class ExercisePage extends ConsumerStatefulWidget {
  static const String route = 'exercisePage';
  const ExercisePage({Key? key, }) : super(key: key);

  @override
  ConsumerState<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends ConsumerState<ExercisePage> {
  Timer? _timer;
  late int _waitTime;
  double _percent = 1.0;
  bool isStarted = true;
  String timeStr = '';

  /// Init state
  @override
  void initState() {
    super.initState();
    _waitTime =
    (Exercises().listDurations[ref.read(selectedDifficultyProvider)] ~/
            Exercises()
                .listOfDifficultyExercises[ref.read(selectedDifficultyProvider)]
                .length);
    print('_________WAIT TIME START: $_waitTime');
    // _waitTime = widget.waitTimeInSec;
    _calculationTime();
    start();
  }

  /// Dispose
  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  /// Start
  void start() {
    if (_waitTime > 0) {
      ref.read(animationPausedProvider.notifier).update((state) => false);
      setState(() {
        isStarted = true;
      });
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        _waitTime -= 1;
        _calculationTime();
        if (_waitTime <= 0) {
          onEnd();
        }
      });
    }
  }

  // void restart() {
  //   _waitTime = widget.waitTimeInSec;
  //   _calculationTime();
  // }

  /// Pause
  void pause() {
    _timer?.cancel();
    ref.read(animationPausedProvider.notifier).update((state) => true);
    setState(() {
      isStarted = false;
    });
  }

  /// Calculation time
  void _calculationTime() {
    String secondsStr = _waitTime.toString();
    setState(() {
      _percent = _waitTime /(
          Exercises().listDurations[ref.read(selectedDifficultyProvider)] /
          Exercises()
              .listOfDifficultyExercises[ref.read(selectedDifficultyProvider)]
              .length);
      print('___________________CALC WAIT TIME: $_waitTime');
      print('___________________ALL TIME: ${Exercises()
          .listDurations[ref.read(selectedDifficultyProvider)]}');
      print('___________________LENGTH: ${Exercises()
          .listOfDifficultyExercises[ref.read(selectedDifficultyProvider)]
          .length}');
      print('___________________PERCENT: $_percent');
      timeStr = secondsStr;
    });
  }

  /// On end
  void onEnd() {
    // ref.read(animationPausedProvider.notifier).update((state) => true);
    if (ref.watch(exerciseNumberProvider) <
        Exercises()
                .listOfDifficultyExercises[
                    ref.watch(selectedDifficultyProvider)]
                .length -
            1) {
      pause();

      /// Dialog 'NEXT'
      showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: Container(
                height: Dimensions.height10 * 20,
                width: Dimensions.width10 * 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.height10 * 30),
                  color: Theme.of(context).dialogBackgroundColor,
                ),
                child: TextButton(
                  onPressed: () {
                    ref
                        .read(completedExerciseProvider.notifier)
                        .update((state) => state + 1);
                    ref
                        .watch(exerciseNumberProvider.notifier)
                        .update((state) => state + 1);

                    _waitTime = Exercises().listDurations[
                            ref.read(selectedDifficultyProvider)] ~/
                        Exercises()
                            .listOfDifficultyExercises[
                                ref.read(selectedDifficultyProvider)]
                            .length;
                    _calculationTime();
                    Navigator.pop(context);
                    start();
                  },
                  child: Text(
                    'NEXT',
                    style: TextStyle(fontSize: Dimensions.height10 * 3, color: MyColors.mainColor),
                  ),
                ),
              ),
            );
          });
    } else {
      /// Dialog 'FINISH'
      showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: Container(
                height: Dimensions.height10 * 20,
                width: Dimensions.width10 * 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.height10 * 30),
                  color: Theme.of(context).dialogBackgroundColor,
                ),
                child: TextButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();

                    DateTime now = DateTime.now();
                    final fullDate = DateTime(now.year, now.month, now.day).toString();
                    final date = fullDate.substring(0, fullDate.length - 13);

                    ref.read(userExpProvider.notifier).update((state) => state + 100);
                    onEnd();

                    ref
                        .read(completedWorkoutProvider.notifier)
                        .update((state) => state + 1);
                    ref
                        .read(minutesProvider.notifier)
                        .update((state) => state + Exercises().listDurations[ref.read(selectedDifficultyProvider)]~/60);
                    await prefs.setInt(date, ref.read(minutesProvider));
                    int? minutes = prefs.getInt(date);
                    print('___________DATE LOADED: $date');
                    print('___________MINUTES LOADED: $minutes');
                    MinutesPerDay().getDaysMinutes(ref.read(selectedWeekProvider));

                    _calculationTime();
                    Navigator.pushNamed(context, HomePageApp.route);
                  },
                  child: Text(
                    'FINISH',
                    style: TextStyle(fontSize: Dimensions.height10 * 3, color: MyColors.mainColor),
                  ),
                ),
              ),
            );
          });

      pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentExerciseNumber = ref.watch(exerciseNumberProvider);
    return SafeArea(
      child: Scaffold(
          body: InkWell(
        onTap: () {
          isStarted ? pause() : start();
        },
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.height10 * 5,
            ),

            /// Timer
            timer(),

            SizedBox(height: Dimensions.height10 / 2),

            /// Exercise description
            ExerciseDescriptionWidget(
                exercise: Exercises().listOfDifficultyExercises[ref.watch(selectedDifficultyProvider)][currentExerciseNumber]),
          ],
        ),
      )),
    );
  }

  /// Timer builder
  Center timer() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Timer
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                  height: Dimensions.height10 * 15,
                  width: Dimensions.width10 * 15,
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      value: _percent,
                      backgroundColor: MyColors.mainColor,
                      strokeWidth: 8,
                    ),
                  )),
              Positioned(
                  child: Text(timeStr,
                      style: TextStyle(
                        color: MyColors.fontGreyColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ))),
            ],
          ),
        ],
      ),
    );
  }
}
