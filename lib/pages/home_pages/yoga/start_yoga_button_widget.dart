import 'package:flutter_yoga_app/pages/home_pages/yoga/exercise_page.dart';
import 'package:flutter_yoga_app/utils/library.dart';
import 'package:flutter_yoga_app/utils/my_colors.dart';


import '../../../riverpod/riverpod.dart';
import '../../../utils/dimensions_util.dart';

class StartYogaButtonWidget extends ConsumerStatefulWidget {
  final int difficulty;
  final int duration;
  const StartYogaButtonWidget({
    Key? key,
    required this.duration,
    required this.difficulty,
  }) : super(key: key);

  @override
  ConsumerState<StartYogaButtonWidget> createState() =>
      _StartYogaButtonWidgetState();
}

class _StartYogaButtonWidgetState extends ConsumerState<StartYogaButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ref
            .read(selectedDifficultyProvider.notifier)
            .update((state) => widget.difficulty);
        ref.read(animationPausedProvider.notifier).update((state) => false);
        ref.read(exerciseNumberProvider.notifier).update((state) => 0);
        ExercisePage(

        );
        Navigator.of(context).pushNamed(ExercisePage.route);
      },
      child: Padding(
        padding: EdgeInsets.only(top: Dimensions.height10 * 3.5),
        child: Container(
          decoration: BoxDecoration(
              color: MyColors.whiteColor,
              borderRadius: BorderRadius.circular(Dimensions.height10 * 3)),
          height: Dimensions.height10 * 4,
          width: Dimensions.width10 * 11,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.width10, right: Dimensions.width10 / 2),
                child: Icon(Icons.play_arrow_rounded, color: MyColors.fontGreyColor,),
              ),
              Text(
                '${widget.duration} min',
                style: TextStyle(
                  color: MyColors.fontGreyColor,
                    fontSize: Dimensions.height10 * 1.8,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
