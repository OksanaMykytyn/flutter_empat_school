import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_6/models/shop.dart';
import 'package:task_6/pages/discount_page.dart';
import 'package:task_6/pages/gift_page.dart';
import 'package:task_6/pages/intro_page.dart';
import 'package:task_6/pages/list_comments.dart';
import 'package:task_6/pages/shop_page.dart';
import 'package:task_6/theme/darkThemeProvider.dart';
import 'package:task_6/theme/style.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
  
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider isDarkTheme = DarkThemeProvider();

  void getCurrentAppTheme() async {
    isDarkTheme.darkTheme = await isDarkTheme.darkThemePreference.getTheme();
  }

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      create: (_) {
        return isDarkTheme;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            theme: Style.themeData(isDarkTheme.darkTheme, context),
            debugShowCheckedModeBanner: false,
            home: const IntroPage(),
            routes: {
              '/intro_page': (context) => const IntroPage(),
              '/shop_page': (context) => const ShopPage(),
              '/gift_page': (context) => const GiftPage(),
              '/discount_page': (context) => const DiscountPage(),
              '/list_comments':(context) => const ListComments(),
            },
          );
        },
      ),
    );
  }
}
