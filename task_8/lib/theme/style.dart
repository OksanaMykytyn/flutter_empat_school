import 'package:flutter/material.dart';
import 'package:task_6/theme.dart';

class Style {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      colorScheme: isDarkTheme
          ? ColorScheme.dark(background: myDarkBlack, 
          primary: myDarkYellow,
          secondary: myDarkWhite,
          onPrimary: myDarkYellow)
          : ColorScheme.light(background: myWhitePink, 
          primary: myBlue,
          secondary: myDarkWhiteGreen,
          onPrimary: myWhitePink),
      appBarTheme: isDarkTheme
          ? AppBarTheme(
              backgroundColor: myDarkYellow, foregroundColor: myDarkBlack)
          : AppBarTheme(backgroundColor: myBlue, foregroundColor: myWhitePink),
      textTheme: isDarkTheme
          ? TextTheme(
              headlineLarge: TextStyle(
                color: myDarkWhite,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              headlineMedium: TextStyle(
                color: myDarkWhite,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              titleLarge: TextStyle(
                  color: myDarkBlack,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
              titleMedium: TextStyle(
                color: myDarkBlack,
                fontSize: 14,
              ),
              bodyMedium: TextStyle(
                color: myDarkWhite,
                fontWeight: FontWeight.w700,
                fontSize: 28,
              ),
              bodySmall: TextStyle(
                color: myDarkWhite,
                fontSize: 14,
              ),
              labelLarge: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: myDarkBlack,
              ),
              labelMedium: TextStyle(
                color: myDarkBlack,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            )
          : TextTheme(
              headlineLarge: TextStyle(
                color: myBlue,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              headlineMedium: TextStyle(
                color: myBlue,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              titleLarge: TextStyle(
                  color: myWhitePink,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
              titleMedium: TextStyle(
                color: myWhitePink,
                fontSize: 14,
              ),
              bodyMedium: TextStyle(
                color: myBlue,
                fontWeight: FontWeight.w700,
                fontSize: 28,
              ),
              bodySmall: TextStyle(
                color: myBlue,
                fontSize: 14,
              ),
              labelLarge: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: myWhitePink,
              ),
              labelMedium: TextStyle(
                color: myWhitePink,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
      iconTheme: isDarkTheme
          ? IconThemeData(color: myDarkBlack)
          : IconThemeData(color: myBlue),
      drawerTheme: isDarkTheme
          ? DrawerThemeData(
              backgroundColor: myDarkGrey,
              elevation: 0.0,
            )
          : DrawerThemeData(backgroundColor: myWhitePink, elevation: 0.0),
    );
  }
}
