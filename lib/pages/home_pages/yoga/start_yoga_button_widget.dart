import 'package:flutter_yoga_app/utils/library.dart';

import '../../../utils/dimensions_util.dart';

class StartYogaButtonWidget extends StatefulWidget {
  final int duration;
  const StartYogaButtonWidget({Key? key, required this.duration}) : super(key: key);

  @override
  State<StartYogaButtonWidget> createState() => _StartYogaButtonWidgetState();
}

class _StartYogaButtonWidgetState extends State<StartYogaButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
      top: Dimensions.height10*3.5),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(Dimensions.height10*3)
          ),
          height: Dimensions.height10*4,
          width: Dimensions.width10*11,
        child: Row(children: [
          Padding(
            padding: EdgeInsets.only(left: Dimensions.width10,
            right: Dimensions.width10/2),
            child: Icon(Icons.play_arrow_rounded),
          ),
          Text('${widget.duration} min', style: TextStyle(fontSize: Dimensions.height10*1.8, fontWeight: FontWeight.bold),)
        ],),
      ),
    );
  }
}
