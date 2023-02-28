import 'package:flutter_yoga_app/pages/home_pages/calendar/schedule_widget.dart';
import 'package:flutter_yoga_app/riverpod/riverpod.dart';
import 'package:flutter_yoga_app/utils/dimensions_util.dart';
import 'package:flutter_yoga_app/utils/library.dart';
import 'package:flutter_yoga_app/utils/my_colors.dart';

class CalendarPage extends ConsumerStatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends ConsumerState<CalendarPage> {

  @override
  Widget build(BuildContext context) {
    final exercises = ref.watch(completedWorkoutProvider);
    final minutes = ref.watch(minutesProvider);
    return Padding(
      padding:
          EdgeInsets.only(left: Dimensions.width10*2, right: Dimensions.width10*2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TableCalendar(
            availableCalendarFormats: {CalendarFormat.week: 'week'},
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(shape: BoxShape.circle, color: MyColors.mainColor),
            //     markerDecoration: BoxDecoration(color: Colors.purpleAccent),
            //     selectedDecoration: BoxDecoration(
            //   color: Colors.purpleAccent
            // )
            ),
            calendarFormat: CalendarFormat.week,
            startingDayOfWeek: StartingDayOfWeek.monday,
            firstDay: DateTime.utc(2023, 1, 1),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
          ),
          Column(children: [
            Row(
              children: [
                Text('Time(minutes)', style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.height10 * 1.6),),
              ],
            ),
            SizedBox(height: Dimensions.height10,),
            ScheduleWidget(),


          ],),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('WEEKLY', style: TextStyle(
                  color: MyColors.fontGreyColor,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.height10 * 1.6),),
              SizedBox(height: Dimensions.height10*3,),

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
                  exercises.toString(),
                  style: TextStyle(
                      color: MyColors.fontGreyColor,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.height10 * 1.8),
                ),
              ],
            ),
              SizedBox(
                height: Dimensions.height10,
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
                    minutes.toString(),
                    style: TextStyle(
                        color: MyColors.fontGreyColor,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.height10 * 1.8),
                  ),
                ],
              ),
            ]
          ),

        ],
      ),
    );
  }
}
