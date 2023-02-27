import 'package:flutter_yoga_app/pages/home_pages/yoga/yoga_widget.dart';
import 'package:flutter_yoga_app/utils/dimensions_util.dart';
import 'package:flutter_yoga_app/utils/library.dart';

class YogaPage extends StatefulWidget {
  const YogaPage({Key? key}) : super(key: key);

  @override
  State<YogaPage> createState() => _YogaPageState();
}

class _YogaPageState extends State<YogaPage> {
  final List<String> difficultyLabels = ["Beginner", "Trained", "Experienced"];
  final List<int> difficultyDurations = [15, 25, 30];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimensions.width10 * 32,
      child: ListView.builder(
          itemCount: difficultyLabels.length,
          itemBuilder: (BuildContext context, int index) {
            return YogaWidget(label: difficultyLabels[index], duration: difficultyDurations[index]);
          }),
    );
  }
}
