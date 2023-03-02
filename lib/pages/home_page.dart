import 'package:flutter_yoga_app/utils/library.dart';

import '../main.dart';
import 'home_page_app.dart';
import 'home_page_clear.dart';
import 'home_page_web.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  final List<Widget> homePages = <Widget>[
    const HomePageApp(),
    const HomePageWeb(),
    const HomePageClear(),
  ];

  @override
  Widget build(BuildContext context) {
    print('__________________________HOME PAGE INDEX: $homePageIndex');

    return SafeArea(
      child: homePages.elementAt(homePageIndex));
  }

 
}
