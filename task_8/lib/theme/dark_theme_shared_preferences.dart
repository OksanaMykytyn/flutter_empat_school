import 'package:shared_preferences/shared_preferences.dart';

class DarkThemeSharedPreferences {

  setDarkTheme(bool darkTheme) {
    SharedPreferences.getInstance().then((prefs) {
    prefs.setBool('darkTheme', darkTheme);
    });
  
  }

  Future<bool> getTheme() async {
    //SharedPreferences.setMockInitialValues({});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('darkTheme') ?? false;
  }

}