// import 'package:flutter_traning_app_1/utils/library.dart';
//
// import 'dart:math' as math;
// import 'dart:async';
//
// import 'package:flutter_traning_app_1/data/exercises.dart';
// import 'package:flutter_traning_app_1/riverpod/riverpod.dart';
// import 'package:flutter_traning_app_1/utils/dimensions_util.dart';
//
// class TimerWidget extends ConsumerStatefulWidget {
//   final int? waitTimeInSec;
//
//
//   const TimerWidget({Key? key, this.waitTimeInSec}) : super(key: key);
//
//   @override
//   ConsumerState<TimerWidget> createState() => _TimerWidgetState();
// }
//
// class _TimerWidgetState extends ConsumerState<TimerWidget> {
//   Timer? _timer;
//   late int _waitTime;
//   double _percent = 1.0;
//   bool isStarted = true;
//   String timeStr = '';
//
//   /// Init state
//   @override
//   void initState() {
//     super.initState();
//     _waitTime = Exercises()
//         .listOfDifficultyExercises[ref.read(selectedDifficultyProvider)]
//             [ref.read(exerciseNumberProvider)]
//         .durationIsSec;
//     // _waitTime = widget.waitTimeInSec;
//     _calculationTime();
//     start();
//   }
//
//   /// Dispose
//   @override
//   void dispose() {
//     super.dispose();
//     _timer?.cancel();
//   }
//
//   /// Start
//   void start() {
//     if (_waitTime > 0) {
//       ref.read(animationPausedProvider.notifier).update((state) => false);
//       setState(() {
//         widget.isStarted = true;
//       });
//       _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//         _waitTime -= 1;
//         _calculationTime();
//         if (_waitTime <= 0) {
//           onEnd();
//         }
//       });
//     }
//   }
//
//   // void restart() {
//   //   _waitTime = widget.waitTimeInSec;
//   //   _calculationTime();
//   // }
//
//   /// Pause
//   void pause() {
//     _timer?.cancel();
//     ref.read(animationPausedProvider.notifier).update((state) => true);
//     setState(() {
//       widget.isStarted = false;
//     });
//   }
//
//   /// Calculation time
//   void _calculationTime() {
//     String secondsStr = _waitTime.toString();
//     setState(() {
//       _percent = _waitTime /
//           Exercises()
//               .listOfDifficultyExercises[ref.read(selectedDifficultyProvider)]
//                   [ref.read(exerciseNumberProvider)]
//               .durationIsSec;
//       timeStr = secondsStr;
//     });
//   }
//
//   /// On end
//   void onEnd() {
//     // ref.read(animationPausedProvider.notifier).update((state) => true);
//     if (ref.watch(exerciseNumberProvider) <
//         Exercises().listOfDifficultyExercises[ref.watch(selectedDifficultyProvider)].length -
//             1) {
//       pause();
//
//       /// Dialog 'NEXT'
//       showDialog(
//           context: context,
//           builder: (context) {
//             return Center(
//               child: Container(
//                 height: Dimensions.height10 * 20,
//                 width: Dimensions.width10 * 20,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(Dimensions.height10 * 30),
//                   color: Theme.of(context).dialogBackgroundColor,
//                 ),
//                 child: TextButton(
//                   onPressed: () {
//                     ref
//                         .watch(exerciseNumberProvider.notifier)
//                         .update((state) => state + 1);
//
//                     _waitTime = Exercises()
//                         .listOfDifficultyExercises[ref.read(selectedDifficultyProvider)]
//                             [ref.read(exerciseNumberProvider)]
//                         .durationIsSec;
//                     _calculationTime();
//                     Navigator.pop(context);
//                     start();
//                   },
//                   child: Text(
//                     'NEXT',
//                     style: TextStyle(fontSize: Dimensions.height10 * 3),
//                   ),
//                 ),
//               ),
//             );
//           });
//     } else {
//       /// Dialog 'FINISH'
//       showDialog(
//           context: context,
//           builder: (context) {
//             return Center(
//               child: Container(
//                 height: Dimensions.height10 * 20,
//                 width: Dimensions.width10 * 20,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(Dimensions.height10 * 30),
//                   color: Theme.of(context).dialogBackgroundColor,
//                 ),
//                 child: TextButton(
//                   onPressed: () {
//                     onEnd();
//
//                     _calculationTime();
//                     Navigator.pushNamed(context, '/AppHomePage');
//                   },
//                   child: Text(
//                     'FINISH',
//                     style: TextStyle(fontSize: Dimensions.height10 * 3),
//                   ),
//                 ),
//               ),
//             );
//           });
//
//       pause();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     /// Animation stop
//     // final animationIsStopped = ref.watch(animationPausedProvider);
//     // animationIsStopped ? pause() : start();
//     return InkWell(
//       /// On tap
//       onTap: () {
//
//         widget.isStarted ? pause() : start();
//       },
//       child: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             /// Timer
//             Stack(
//               alignment: Alignment.center,
//               children: [
//                 Container(
//                     height: Dimensions.height10 * 15,
//                     width: Dimensions.width10 * 15,
//                     child: Transform(
//                       alignment: Alignment.center,
//                       transform: Matrix4.rotationY(math.pi),
//                       child: CircularProgressIndicator(
//                         color: Colors.blueGrey[100],
//                         value: _percent,
//                         backgroundColor: Colors.green[400],
//                         strokeWidth: 8,
//                       ),
//                     )),
//                 Positioned(
//                     child: Text(timeStr,
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 40,
//                         ))),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
