import 'package:flutter_yoga_app/pages/home_pages/yoga/yoga_widget.dart';
import 'package:flutter_yoga_app/utils/dimensions_util.dart';
import 'package:flutter_yoga_app/utils/library.dart';

import '../../../riverpod/riverpod.dart';
import 'exercise_page.dart';

class YogaPage extends ConsumerStatefulWidget {
  const YogaPage({Key? key}) : super(key: key);

  @override
  ConsumerState<YogaPage> createState() => _YogaPageState();
}

class _YogaPageState extends ConsumerState<YogaPage> {
  final List<String> difficultyLabels = ["Beginner", "Trained", "Experienced"];
  final List<int> difficultyDurations = [15, 25, 30];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimensions.width10 * 32,
      child: ListView.builder(
          itemCount: difficultyLabels.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                onTap: () {
                  ref
                      .read(selectedDifficultyProvider.notifier)
                      .update((state) => index);
                  ref.read(animationPausedProvider.notifier).update((state) => false);
                  ref.read(exerciseNumberProvider.notifier).update((state) => 0);
                  // ExercisePage(
                  //
                  // );
                  Navigator.of(context).pushNamed(ExercisePage.route);
                },
                child: YogaWidget(index: index, label: difficultyLabels[index], duration: difficultyDurations[index]));
          }),
    );
  }
}
