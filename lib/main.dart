import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_yoga_app/pages/home_page_app.dart';
import 'package:flutter_yoga_app/pages/home_pages/yoga/exercise_page.dart';

import 'package:flutter_yoga_app/utils/library.dart';

final container = ProviderContainer();

void main() {
  /// Check initialization
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const HomePageApp(),
      routes: {
        // '/homePage': (context) => const HomePage(),
        HomePageApp.route: (context) => const HomePageApp(),
        // '/homePageWeb': (context) => const HomePageWeb(),
        ExercisePage.route: (context) => ExercisePage(

            ),
      },
    );
  }
}
