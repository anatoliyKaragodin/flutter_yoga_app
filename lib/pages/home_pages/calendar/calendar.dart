import 'package:flutter_yoga_app/pages/home_pages/calendar/schedule_widget.dart';
import 'package:flutter_yoga_app/utils/dimensions_util.dart';
import 'package:flutter_yoga_app/utils/library.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: Dimensions.width10*2, right: Dimensions.width10*2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TableCalendar(
            availableCalendarFormats: {CalendarFormat.week: 'week'},
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(shape: BoxShape.circle, color: Colors.purpleAccent[100]),
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
            children: [

              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Exersices:',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.height10 * 1.8),
                ),
                Text(
                  '0',
                  style: TextStyle(
                      color: Colors.black54,
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
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.height10 * 1.8),
                  ),
                  Text(
                    '0',
                    style: TextStyle(
                        color: Colors.black54,
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
