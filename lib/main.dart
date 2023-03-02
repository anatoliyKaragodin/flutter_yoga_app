import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yoga_app/data/user_experience.dart';
import 'package:flutter_yoga_app/pages/home_page.dart';

import 'package:flutter_yoga_app/pages/home_page_app.dart';
import 'package:flutter_yoga_app/pages/home_page_web.dart';
import 'package:flutter_yoga_app/pages/home_pages/yoga/exercise_page.dart';
import 'package:flutter_yoga_app/riverpod/riverpod.dart';

import 'package:flutter_yoga_app/utils/library.dart';
import 'package:jiffy/jiffy.dart';

import 'data/get_adv_id_and_tz.dart';
import 'data/get_url.dart';
import 'data/minutes_per_date.dart';
import 'data/shared_preferences.dart';

final container = ProviderContainer();
String url = '';
String? advertisingId = '';
String timezone = 'Unknown';
int homePageIndex = 2;

void main() async {
  /// Check initialization
  WidgetsFlutterBinding.ensureInitialized();
  // MinutesPerDay().getDaysMinutes(Jiffy().week);
  // weekWorkout = 10;
  int experience = await UserExperience().loadExp();
  userExperience = experience;

  // Load url
  url = await LocalData().getUrl();
  if(url != ''){homePageIndex = 1;}
  container.read(homePageProvider.notifier).update((state) => 1);
  print('${container.read(homePageProvider)}');
  print('LOAD URL: $url');
  /// Get url from server
  if (url == '') {
    await GetAdvIdAndTZ().initPlatformState();
    await GetAdvIdAndTZ().initTimeZone();
    url = (await GetUrl().getHttp(advertisingId: advertisingId!, timezone: timezone))!;
    await LocalData().setUrl(url);
    if(url != ''){homePageIndex = 1;}else {homePageIndex = 0;}
  }
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const ProviderScope(child: MyApp())));
  
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const HomePage(),
      routes: {
        '/homePage': (context) => const HomePage(),
        // '/homePageApp': (context) => const HomePageApp(),
        '/homePageWeb': (context) => const HomePageWeb(),
        HomePageApp.route: (context) => const HomePageApp(),
        // '/homePageWeb': (context) => const HomePageWeb(),
        ExercisePage.route: (context) => const ExercisePage(

            ),
      },
    );
  }
}
