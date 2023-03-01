import 'package:flutter_yoga_app/data/minutes_per_date.dart';
import 'package:flutter_yoga_app/riverpod/riverpod.dart';
import 'package:flutter_yoga_app/utils/dimensions_util.dart';
import 'package:flutter_yoga_app/utils/library.dart';
import 'package:flutter_yoga_app/utils/my_colors.dart';
import 'package:intl/intl.dart';

class ScheduleWidget extends ConsumerStatefulWidget {
  const ScheduleWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ScheduleWidget> createState() => _ScheduleWidgetState();
}

class _ScheduleWidgetState extends ConsumerState<ScheduleWidget> {

  final double padding = Dimensions.width10 * 0.65;
  final Color? color = MyColors.mainColor;
  @override
  Widget build(BuildContext context) {
    final week = ref.watch(selectedWeekProvider);
    
    // DateTime date = DateTime.now();
    // String day = DateFormat('EEEE').format(date);
    // print(day);
    // final minutes = ref.watch(minutesProvider);
    return Container(
      /// Schedule size
      height: Dimensions.height10 * 20,
      width: Dimensions.screenWidth,
      child: Row(
        children: [
          /// Scale
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: Dimensions.height10 * 2),
                child: Text('60',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.height10 * 1.6)),
              ),
              Text('30',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.height10 * 1.6)),
              Padding(
                padding: EdgeInsets.only(bottom: Dimensions.height10 * 3),
                child: Text('0',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.height10 * 1.6)),
              ),
            ],
          ),

          /// Monday
          Padding(
            padding: EdgeInsets.only(left: padding, right: padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${mondayMinutes}',
                  style: TextStyle(
                      color: MyColors.fontGreyColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                    height: Dimensions.height10 * 12,
                    width: Dimensions.width10 * 3,
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: LinearProgressIndicator(
                        color: color,
                        backgroundColor: Colors.white70,
                        value: mondayMinutes / 60,
                      ),
                    )),
                Text('M',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.height10 * 1.8)),
              ],
            ),
          ),

          /// Tuesday
          Padding(
            padding: EdgeInsets.only(left: padding, right: padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${tuesdayMinutes}',
                  style: TextStyle(
                      color: MyColors.fontGreyColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                    height: Dimensions.height10 * 12,
                    width: Dimensions.width10 * 3,
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: LinearProgressIndicator(
                        color: color,
                        backgroundColor: Colors.white70,
                        value: tuesdayMinutes / 60,
                      ),
                    )),
                Text('T',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.height10 * 1.8)),
              ],
            ),
          ),

          /// Wednesday
          Padding(
            padding: EdgeInsets.only(left: padding, right: padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${wednesdayMinutes}',
                  style: TextStyle(
                      color: MyColors.fontGreyColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                    height: Dimensions.height10 * 12,
                    width: Dimensions.width10 * 3,
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: LinearProgressIndicator(
                        color: color,
                        backgroundColor: Colors.white70,
                        value: wednesdayMinutes / 60,
                      ),
                    )),
                Text('W',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.height10 * 1.8)),
              ],
            ),
          ),
          /// Thursday
          Padding(
            padding: EdgeInsets.only(left: padding, right: padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${thursdayMinutes}',
                  style: TextStyle(
                      color: MyColors.fontGreyColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                    height: Dimensions.height10 * 12,
                    width: Dimensions.width10 * 3,
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: LinearProgressIndicator(
                        color: color,
                        backgroundColor: Colors.white70,
                        value: thursdayMinutes / 60,
                      ),
                    )),
                Text('T',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.height10 * 1.8)),
              ],
            ),
          ),
          /// Friday
          Padding(
            padding: EdgeInsets.only(left: padding, right: padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${fridayMinutes}',
                  style: TextStyle(
                      color: MyColors.fontGreyColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                    height: Dimensions.height10 * 12,
                    width: Dimensions.width10 * 3,
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: LinearProgressIndicator(
                        color: color,
                        backgroundColor: Colors.white70,
                        value: fridayMinutes / 60,
                      ),
                    )),
                Text('F',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.height10 * 1.8)),
              ],
            ),
          ),
          /// Saturday
          Padding(
            padding: EdgeInsets.only(left: padding, right: padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${saturdayMinutes}',
                  style: TextStyle(
                      color: MyColors.fontGreyColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                    height: Dimensions.height10 * 12,
                    width: Dimensions.width10 * 3,
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: LinearProgressIndicator(
                        color: color,
                        backgroundColor: Colors.white70,
                        value: saturdayMinutes / 60,
                      ),
                    )),
                Text('S',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.height10 * 1.8)),
              ],
            ),
          ),
          /// Sunday
          Padding(
            padding: EdgeInsets.only(left: padding, right: padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${sundayMinutes}',
                  style: TextStyle(
                      color: MyColors.fontGreyColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                    height: Dimensions.height10 * 12,
                    width: Dimensions.width10 * 3,
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: LinearProgressIndicator(
                        color: color,
                        backgroundColor: Colors.white70,
                        value: sundayMinutes / 60,
                      ),
                    )),
                Text('S',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.height10 * 1.8)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
