import 'package:flutter_yoga_app/data/user_experience.dart';

import 'package:flutter_yoga_app/utils/library.dart';

import '../../../utils/dimensions_util.dart';
import '../../../utils/my_colors.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    // final level = ref.watch(userLevelProvider);
    final exp = userExperience;
    // ref.watch(userExpProvider);
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
            MyColors.mainColor!,
            MyColors.mainColor!.withOpacity(0.05),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          // color: Colors.purpleAccent[100]?.withOpacity(0.5),
          borderRadius: BorderRadius.circular(Dimensions.height10 * 4)),
      height: Dimensions.height10 * 23,
      width: Dimensions.width10 * 32,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.only(top: Dimensions.height10),
            child: Text(
              'My profile',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Dimensions.width10 * 2,
                  fontWeight: FontWeight.bold),
            ),
          ),

             Image.asset('assets/images/иконка йоги BIG.png', height: Dimensions.height10*12,),

          Column(
            children: [
              SizedBox(
                width: Dimensions.width10 * 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'LEVEL ${(exp~/1000)+1}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: MyColors.fontGreyColor,),
                    ),
                    Text(
                      '${(exp % 1000)} / 1000',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: MyColors.fontGreyColor),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              SizedBox(
                  width: Dimensions.width10 * 25,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(Dimensions.height10)),
                    child: LinearProgressIndicator(
                      color: MyColors.mainColor,
                      minHeight: Dimensions.height10*0.6,
                      backgroundColor: Colors.white70,
                      value: (exp%1000)/1000,
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: Dimensions.height10 / 2,
          )
        ],
      ),
    );
  }
}
