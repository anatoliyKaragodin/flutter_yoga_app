import 'package:flutter/material.dart';
import 'package:flutter_yoga_app/pages/home_pages/yoga/start_yoga_button_widget.dart';
import 'package:flutter_yoga_app/utils/dimensions_util.dart';
import 'package:flutter_yoga_app/utils/my_colors.dart';

class YogaWidget extends StatefulWidget {
  final int index;
  final String label;
  final int duration;
  const YogaWidget({Key? key, required this.label, required this.duration, required this.index}) : super(key: key);

  @override
  State<YogaWidget> createState() => _YogaWidgetState();
}

class _YogaWidgetState extends State<YogaWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: Dimensions.height10 * 2, bottom: Dimensions.height10 * 2),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
              MyColors.mainColor!,
              MyColors.mainColor!.withOpacity(0.1),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            borderRadius: BorderRadius.circular(Dimensions.height10 * 4)),
        height: Dimensions.height10 * 20,
        width: Dimensions.width10 * 32,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: Dimensions.width10*2),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: Dimensions.height10 * 3,
                        bottom: Dimensions.height10,
                        ),
                    child: Row(
                      children: [
                        Text(widget.label,
                            style: TextStyle(
                              color: Colors.white,
                                fontSize: Dimensions.height10 * 2.5,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //       bottom: Dimensions.height10,
                  //       ),
                  //   child: Row(
                  //     children: [
                  //       Text(
                  //         'with Emma Robertson',
                  //         style: TextStyle(color: Colors.black45, fontSize: Dimensions.height10*1.3),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: Dimensions.height10*2,),
                  Row(
                    children: [
                      StartYogaButtonWidget(difficulty: widget.index, duration: widget.duration),
                    ],
                  )
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: Dimensions.width10*13),
                child: Image.asset('assets/images/0.png', width: Dimensions.width10*100,
                height: Dimensions.height10*100,))
          ],
        ),
      ),
    );
  }
}
