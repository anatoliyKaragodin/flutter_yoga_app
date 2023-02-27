import 'package:flutter_yoga_app/utils/library.dart';

import '../../utils/dimensions_util.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
            Colors.purpleAccent[100]!.withOpacity(0.5),
            Colors.purpleAccent[100]!.withOpacity(0.1),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          // color: Colors.purpleAccent[100]?.withOpacity(0.5),
          borderRadius: BorderRadius.circular(Dimensions.height10 * 4)),
      height: Dimensions.height10 * 23,
      width: Dimensions.width10 * 32,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Chet Manly',
            style: TextStyle(
                color: Colors.white,
                fontSize: Dimensions.width10 * 2,
                fontWeight: FontWeight.bold),
          ),
          CircleAvatar(
            radius: Dimensions.height10*6,
            backgroundColor: Colors.white70,
            child: CircleAvatar(
              radius: Dimensions.height10*5.5,
              backgroundImage: AssetImage('assets/images/Avatar.jpg'),
            ),
          ),
          Column(
            children: [
              SizedBox(
                width: Dimensions.width10 * 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'LEVEL 1',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black45),
                    ),
                    Text(
                      '700 / 1000',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black45),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              SizedBox(
                  width: Dimensions.width10 * 25,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.white70,
                    value: 0.7,
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
