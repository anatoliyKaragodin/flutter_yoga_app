import 'package:flutter_yoga_app/data/minutes_per_week.dart';
import 'package:flutter_yoga_app/pages/home_pages/calendar/exercises_and_time_widget.dart';
import 'package:flutter_yoga_app/pages/home_pages/calendar/schedule_widget.dart';
import 'package:flutter_yoga_app/riverpod/riverpod.dart';
import 'package:flutter_yoga_app/utils/dimensions_util.dart';
import 'package:flutter_yoga_app/utils/library.dart';
import 'package:flutter_yoga_app/utils/my_colors.dart';
import 'package:jiffy/jiffy.dart';

import '../../../data/exercises_per_week.dart';
import '../../../data/minutes_per_date.dart';

class CalendarPage extends ConsumerStatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends ConsumerState<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    // final week = ref.watch(selectedWeekProvider);
    // MinutesPerDay().getDaysMinutes();
    // print('${WeekNumber().weekNumber}');
    final exercises = ref.watch(completedWorkoutProvider);
    // final minutes = ref.watch(minutesProvider);
    // final mondayMins = ref.watch(mondayMinutesProvider);
    // final tuesdayMins = ref.watch(mondayMinutesProvider);
    // final wednesdayMins = ref.watch(mondayMinutesProvider);
    // final thursdayMins = ref.watch(mondayMinutesProvider);
    // final fridayMins = ref.watch(mondayMinutesProvider);
    // final saturdayMins = ref.watch(mondayMinutesProvider);
    // final sundayMins = ref.watch(mondayMinutesProvider);
    // MinutesPerWeek().getWeekMinutes();

    return Padding(
      padding: EdgeInsets.only(
          left: Dimensions.width10 * 2, right: Dimensions.width10 * 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TableCalendar(
            /// on change week
            onPageChanged: (DateTime date) {
              mondayMinutes = 0;
              tuesdayMinutes = 0;
              wednesdayMinutes = 0;
              thursdayMinutes = 0;
              fridayMinutes = 0;
              saturdayMinutes = 0;
              sundayMinutes = 0;
              weekMinutes = 0;
              weekWorkout = 0;
              int week = Jiffy(date).week;

              ref.watch(selectedWeekProvider.notifier).update((state) => week);
              MinutesPerDay().getDaysMinutes(week);
              ExercisesPerWeek().getExercisesPerWeek(week);
              // MinutesPerWeek().getWeekMinutes();
              print('CHANGED WEEK: ${ref.read(selectedWeekProvider)}');
            },
            weekNumbersVisible: true,
            availableCalendarFormats: {CalendarFormat.week: 'week'},
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                  shape: BoxShape.circle, color: MyColors.mainColor),
              //     markerDecoration: BoxDecoration(color: Colors.purpleAccent),
              //     selectedDecoration: BoxDecoration(
              //   color: Colors.purpleAccent
              // )
            ),
            calendarFormat: CalendarFormat.week,
            startingDayOfWeek: StartingDayOfWeek.monday,
            firstDay: DateTime.utc(2023, 1, 1),
            lastDay: DateTime.utc(2050, 1, 1),
            focusedDay: DateTime.now(),
          ),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    'Time(minutes)',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.height10 * 1.6),
                  ),
                ],
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              const ScheduleWidget(),
            ],
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

            SizedBox(
              height: Dimensions.height10 * 3,
            ),

            ExercisesAndTimeWidget(),
          ]),
        ],
      ),
    );
  }
}
