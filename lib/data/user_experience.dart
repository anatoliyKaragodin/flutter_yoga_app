import 'package:flutter_yoga_app/main.dart';
import 'package:flutter_yoga_app/riverpod/riverpod.dart';
import 'package:flutter_yoga_app/utils/library.dart';

late int userExperience;

class UserExperience {
  void saveExp(int exp) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('userExperience', exp);
  }

  Future<int> loadExp() async{
    final prefs = await SharedPreferences.getInstance();
    int loadedExp = prefs.getInt('userExperience') ?? 0;
    print('_____________EXP LOADED: $loadedExp');
    // container.read(userExpProvider.notifier).update((state) => loadedExp);
    return loadedExp;
  }
}