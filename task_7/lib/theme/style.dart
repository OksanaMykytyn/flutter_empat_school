import 'package:flutter/material.dart';
import 'package:task_6/theme.dart';

class Style {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      colorScheme: isDarkTheme
          ? ColorScheme.dark(background: mydarkblack, primary: mydarkyellow)
          : ColorScheme.light(background: mywhitepink, primary: myblue),
      appBarTheme: isDarkTheme
          ? AppBarTheme(
              backgroundColor: mydarkyellow, foregroundColor: mydarkblack)
          : AppBarTheme(backgroundColor: myblue, foregroundColor: mywhitepink),
      textTheme: isDarkTheme
          ? TextTheme(
              headlineLarge: TextStyle(
                color: mydarkwhite,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              headlineMedium: TextStyle(
                color: mydarkwhite,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              titleLarge: TextStyle(
                  color: mydarkblack,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
              titleMedium: TextStyle(
                color: mydarkblack,
                fontSize: 14,
              ),
              bodyMedium: TextStyle(
                color: mydarkwhite,
                fontWeight: FontWeight.w700,
                fontSize: 28,
              ),
              bodySmall: TextStyle(
                color: mydarkwhite,
                fontSize: 14,
              ),
              labelLarge: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: mydarkblack,
              ),
              labelMedium: TextStyle(
                color: mydarkblack,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            )
          : TextTheme(
              headlineLarge: TextStyle(
                color: myblue,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              headlineMedium: TextStyle(
                color: myblue,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              titleLarge: TextStyle(
                  color: mywhitepink,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
              titleMedium: TextStyle(
                color: mywhitepink,
                fontSize: 14,
              ),
              bodyMedium: TextStyle(
                color: myblue,
                fontWeight: FontWeight.w700,
                fontSize: 28,
              ),
              bodySmall: TextStyle(
                color: myblue,
                fontSize: 14,
              ),
              labelLarge: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: mywhitepink,
              ),
              labelMedium: TextStyle(
                color: mywhitepink,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
      iconTheme: isDarkTheme
          ? IconThemeData(color: mydarkblack)
          : IconThemeData(color: myblue),
      drawerTheme: isDarkTheme
          ? DrawerThemeData(
              backgroundColor: mydarkgrey,
              elevation: 0.0,
            )
          : DrawerThemeData(backgroundColor: mywhitepink, elevation: 0.0),
    );
  }
}
