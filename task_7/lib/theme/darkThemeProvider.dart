import 'package:flutter/material.dart';
import 'package:task_6/theme/dark_theme_shared_preferences.dart';

class DarkThemeProvider extends ChangeNotifier {
  DarkThemeSharedPreferences darkThemePreference = DarkThemeSharedPreferences();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}