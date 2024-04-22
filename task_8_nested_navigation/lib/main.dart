import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_6/models/shop.dart';
import 'package:task_6/routes/app_navigation.dart';
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
          return MaterialApp.router(
            theme: Style.themeData(isDarkTheme.darkTheme, context),
            debugShowCheckedModeBanner: false,
            routerConfig: AppNavigation.router,
            //home: const HomePage(),
            //routes: {
              //'/intro_page': (context) => const IntroPage(),
             // '/shop_page': (context) => const ShopPage(),
             // '/gift_page': (context) => const GiftPage(),
             // '/discount_page': (context) => const DiscountPage(),
             // '/list_comments':(context) => const ListComments(),
             // '/home_page':(context) => const HomePage(),
            //},
          );
        },
      ),
    );
  }
}
