import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
        primary: Color(0xFFD0D5FF),
        onPrimary: Color(0xFFFFF2DD),
        background: Colors.white,
        secondary: Colors.black,
        onSecondary: Color(0xFF464646)),
    textTheme: const TextTheme(
      labelSmall: TextStyle(fontFamily: 'Kodchasan', fontSize: 12),
      //for banner
      headlineLarge: TextStyle(
          fontFamily: 'Kodchasan',
          fontSize: 14,
          color: Color(0xFF464646),
          fontWeight: FontWeight.w700),
      //for simple button
      titleSmall: TextStyle(
          fontFamily: 'Kodchasan',
          fontSize: 12,
          color: Color.fromARGB(255, 31, 31, 31),
          fontWeight: FontWeight.w700),
      //was for button, is for all text
      titleMedium: TextStyle(
          fontFamily: 'Kodchasan',
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Color(0xFF464646)),
      bodySmall: TextStyle(
          fontFamily: 'Kodchasan',
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Color(0xFF464646)),
      //is for button
      bodyMedium: TextStyle(
          fontFamily: 'Kodchasan',
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Color.fromARGB(255, 31, 31, 31)),
      titleLarge: TextStyle(
          fontFamily: 'Kodchasan',
          fontSize: 18,
          color: Color.fromRGBO(222, 180, 113, 1),
          fontWeight: FontWeight.w700),
      headlineMedium: TextStyle(
          fontFamily: 'Kodchasan',
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Color(0xFF464646)),
      headlineSmall: TextStyle(
          fontFamily: 'Kodchasan', fontSize: 12, color: Color(0xFF464646)
          //fontWeight: FontWeight.w700,
          ),
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
        titleTextStyle: TextStyle(
            fontFamily: 'Kodchasan',
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color(0xFF464646))));
//Color(0xff6a0f49), onPrimary: Color(0xff037171)
ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme.light(
        primary: Color(0xFFD0D5FF),
        onPrimary: Color(0xFFFFF2DD),
        background: Color(0xff202124),
        secondary: Colors.white,
        onSecondary: Color.fromARGB(255, 212, 212, 212)),
    textTheme: const TextTheme(
      labelSmall:
          TextStyle(fontFamily: 'Kodchasan', fontSize: 12, color: Colors.white),
      //for banner
      headlineLarge: TextStyle(
          fontFamily: 'Kodchasan',
          fontSize: 14,
          color: Colors.black,
          fontWeight: FontWeight.w700),
      //for simple button
      titleSmall: TextStyle(
          fontFamily: 'Kodchasan',
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.w700),
      //was for order button, is for all text
      titleMedium: TextStyle(
        fontFamily: 'Kodchasan',
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Kodchasan',
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      //is for order button
      bodyMedium: TextStyle(
          fontFamily: 'Kodchasan',
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Color.fromARGB(255, 31, 31, 31)),
      titleLarge: TextStyle(
          fontFamily: 'Kodchasan',
          fontSize: 18,
          color: Color.fromRGBO(222, 180, 113, 1),
          fontWeight: FontWeight.w700),
      headlineMedium: TextStyle(
          fontFamily: 'Kodchasan',
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.black),
      headlineSmall:
          TextStyle(fontFamily: 'Kodchasan', fontSize: 12, color: Colors.black
              //fontWeight: FontWeight.w700,
              ),
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        foregroundColor: Colors.black,
        titleTextStyle: TextStyle(
            fontFamily: 'Kodchasan',
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.black)));
