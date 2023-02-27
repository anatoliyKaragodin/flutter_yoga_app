import 'package:flutter/material.dart';
import 'package:flutter_yoga_app/pages/home_pages/yoga/start_yoga_button_widget.dart';
import 'package:flutter_yoga_app/utils/dimensions_util.dart';

class YogaWidget extends StatefulWidget {
  const YogaWidget({Key? key}) : super(key: key);

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
              Colors.purpleAccent[100]!.withOpacity(0.5),
              Colors.purpleAccent[100]!.withOpacity(0.1),
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
                        Text('Yoga',
                            style: TextStyle(
                                fontSize: Dimensions.height10 * 3,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: Dimensions.height10,
                        ),
                    child: Row(
                      children: [
                        Text(
                          'with Emma Robertson',
                          style: TextStyle(color: Colors.black45, fontSize: Dimensions.height10*1.3),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      StartYogaButtonWidget(),
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
