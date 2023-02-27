import 'package:flutter_yoga_app/utils/dimensions_util.dart';
import 'package:flutter_yoga_app/utils/library.dart';

class ScheduleWidget extends StatefulWidget {
  const ScheduleWidget({Key? key}) : super(key: key);

  @override
  State<ScheduleWidget> createState() => _ScheduleWidgetState();
}

class _ScheduleWidgetState extends State<ScheduleWidget> {
  final double padding = Dimensions.width10*0.65;
  final Color color = Colors.purpleAccent.shade100.withOpacity(0.5);
  @override
  Widget build(BuildContext context) {
    return Container(
      /// Schedule size
      height: Dimensions.height10 * 15,
      width: Dimensions.screenWidth,
      child: Row(
        children: [
          /// Scale
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('60',  style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.height10 * 1.6)),
              Text('0',  style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.height10 * 1.6)),
            ],
          ),
          Padding(
            padding:EdgeInsets.only(left: padding,
                right: padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: Dimensions.height10 * 12,
                    width: Dimensions.width10*3,
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: LinearProgressIndicator(
                        color: color,
                        backgroundColor: Colors.white70,
                        value: 0.7,
                      ),
                    )),
                Text('M',  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.height10 * 1.8)),
              ],
            ),
          ),
          Padding(
            padding:EdgeInsets.only(left: padding,
                right: padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: Dimensions.height10 * 12,
                    width: Dimensions.width10*3,
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: LinearProgressIndicator(
                        color: color,
                        backgroundColor: Colors.white70,
                        value: 0.7,
                      ),
                    )),
                Text('T',  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.height10 * 1.8)),
              ],
            ),
          ),
          Padding(
            padding:EdgeInsets.only(left: padding,
                right: padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: Dimensions.height10 * 12,
                    width: Dimensions.width10*3,
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: LinearProgressIndicator(
                        color: color,
                        backgroundColor: Colors.white70,
                        value: 0.7,
                      ),
                    )),
                Text('W',  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.height10 * 1.8)),
              ],
            ),
          ),
          Padding(
            padding:EdgeInsets.only(left: padding,
                right: padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: Dimensions.height10 * 12,
                    width: Dimensions.width10*3,
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: LinearProgressIndicator(
                        color: color,
                        backgroundColor: Colors.white70,
                        value: 0.7,
                      ),
                    )),
                Text('T',  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.height10 * 1.8)),
              ],
            ),
          ),
          Padding(
            padding:EdgeInsets.only(left: padding,
                right: padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: Dimensions.height10 * 12,
                    width: Dimensions.width10*3,
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: LinearProgressIndicator(
                        color: color,
                        backgroundColor: Colors.white70,
                        value: 0.7,
                      ),
                    )),
                Text('F',  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.height10 * 1.8)),
              ],
            ),
          ),
          Padding(
            padding:EdgeInsets.only(left: padding,
                right: padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: Dimensions.height10 * 12,
                    width: Dimensions.width10*3,
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: LinearProgressIndicator(
                        color: color,
                        backgroundColor: Colors.white70,
                        value: 0.7,
                      ),
                    )),
                Text('S',  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.height10 * 1.8)),
              ],
            ),
          ),
          Padding(
            padding:EdgeInsets.only(left: padding,
                right: padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: Dimensions.height10 * 12,
                    width: Dimensions.width10*3,
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: LinearProgressIndicator(
                        color: color,
                        backgroundColor: Colors.white70,
                        value: 0.7,
                      ),
                    )),
                Text('S',  style: TextStyle(
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
