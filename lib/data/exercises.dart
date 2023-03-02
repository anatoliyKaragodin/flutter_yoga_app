import '../models/exercise_model.dart';

class Exercises {
  static List<ExerciseModel> exercisesList0 = [
    AllExercises().allExercises[0],
    AllExercises().allExercises[1],
    AllExercises().allExercises[2],
    AllExercises().allExercises[3],
  ];
  static List<ExerciseModel> exercisesList1 = [
    AllExercises().allExercises[0],
    AllExercises().allExercises[1],
    AllExercises().allExercises[2],
    AllExercises().allExercises[3],
    AllExercises().allExercises[4],
    AllExercises().allExercises[5],
    AllExercises().allExercises[6],
  ];
  static List<ExerciseModel> exercisesList2 = [
    AllExercises().allExercises[0],
    AllExercises().allExercises[1],
    AllExercises().allExercises[2],
    AllExercises().allExercises[3],
    AllExercises().allExercises[4],
    AllExercises().allExercises[5],
    AllExercises().allExercises[6],
    AllExercises().allExercises[7],
    AllExercises().allExercises[8],
    AllExercises().allExercises[9],
  ];

  List<List<ExerciseModel>> listOfDifficultyExercises = [
    exercisesList0,
    exercisesList1,
    exercisesList2,
  ];
  List<int> listDurations = [900, 1500, 1800];
}

class AllExercises {
  List<ExerciseModel> allExercises = [
    /// 0
    ExerciseModel(
      label: 'Wide forward stance',
      description:
          "Spread your legs wide apart, thumbs pointing slightly inward. Take a deep breath. While inhaling, slowly raise your arms up and join your palms above your head.\nAs you exhale with a straight back, bend down. At the bottom point, touch the floor with your palms.\nIf you can’t reach the floor with your hands, then clasp your elbows with your hands and begin to sway from side to side.\nTry to completely relax by coming to the bottom point.",
      image: 'assets/exercises/1.png',
    ),

    /// 1
    ExerciseModel(
      label: 'Goddess Pose',
      description:
          "Place your feet wide apart, socks pointing to the sides.\nBend your knees and try to go into a deep squat. In this case, you must confidently keep your balance.\nSpread your arms to the sides and bend at the elbows, fingers should look up. You can combine the thumb and index into a ring.\nHold this position for a few seconds and focus on your breath.",
      image: 'assets/exercises/2.png',
    ),

    /// 2
    ExerciseModel(
      label: 'Warrior Pose II',
      description:
          "Place your legs wide apart, turn your left so that your knee looks forward. Right firmly rest on the floor.\nBend your left knee at an angle of 90 degrees, spread your arms to the sides, and look straight ahead. The abdomen is tucked up.\nHold this position and take a few deep breaths in and out.",
      image: 'assets/exercises/3.png',
    ),

    /// 3
    ExerciseModel(
      label: 'Peaceful warrior',
      description:
          'From the previous asana, tilt the body to the right to a straight leg.\nReach for your head with your left hand, and place your right hand on the calf of your right leg.\nTry to look up.\nRemaining in this position, breathe deeply for a few seconds.',
      image: 'assets/exercises/4.png',
    ),

    /// 4
    ExerciseModel(
      label: 'Extended Angle Pose',
      description:
          'Get into Warrior II Pose and from there tilt your torso to the left towards your bent leg.\nStretch your right arm up diagonally, and place your left elbow on the thigh of your bent left leg.\nIn this position, the main weight should fall on the supporting heel of the left foot.\nBreathe deeply in this position.',
      image: 'assets/exercises/5.png',
    ),

    /// 5
    ExerciseModel(
      label: 'Warrior Pose I',
      description:
          "Straighten both legs, slightly reducing the distance between them, the left leg looks sideways. Bend it at the knee so that the angle is slightly more than 90 degrees.\nKeep your body straight, stretch your arms in front of you. They look in the same direction as the knee of the left leg.\nStaying in this position, take a few deep breaths in and out.",
      image: 'assets/exercises/6.png',
    ),

    /// 6
    ExerciseModel(
      label: 'Warrior Pose III',
      description:
          "Come out of the previous asana by placing your feet closer together. Push off with your right foot, lift it off the floor, and start balancing on your left. At first, it can be slightly bent to make it easier to find a fulcrum.\nTighten your buttocks and stretch your right leg back. Hands can be extended both to the sides and forward.\nBreathe deeply in this position.",
      image: 'assets/exercises/7.png',
    ),

    /// 7
    ExerciseModel(
      label: 'Tree pose',
      description:
          "Stand up straight. Bend the right leg at the knee and place the foot on the inner surface of the left thigh. The foot can be either above or below the knee.\nBend your arms and join your palms in front of your chest.\nIt is important to find a foothold from the very beginning in order to maintain balance in the future.\nBreathe deeply in this position.",
      image: 'assets/exercises/8.png',
    ),

    /// 8
    ExerciseModel(
      label: 'Triangle Pose',
      description:
          "Set your feet wide, the toe of your left foot is turned and looks to the side. Legs are straight.\nFrom this position, tilt the body to the left so that the right hand looks up, and place the left hand on the left leg closer to the foot. Try to open your chest as much as possible.\nHold this position and breathe deeply.",
      image: 'assets/exercises/9.png',
    ),

    /// 9
    ExerciseModel(
      label: 'Pyramid pose',
      description:
          "Place your feet wide apart, the toe of your left foot turned to the side. Turn the body towards the left leg.\nPut your hands behind your back and slowly lower your body to parallel with the floor. The back should be straight.\nNo need to go too low, it is important to feel every muscle.\nHold at the bottom point and take a few deep breaths in and out.\nDo one more such cycle on the other side of the body.",
      image: 'assets/exercises/10.png',
    ),
  ];
}
