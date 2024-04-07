import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_6/models/shop.dart';
import 'package:task_6/pages/discount_page.dart';
import 'package:task_6/pages/gift_page.dart';
import 'package:task_6/pages/intro_page.dart';
import 'package:task_6/pages/shop_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: const IntroPage(),
     routes: {
      '/intro_page':(context) => const IntroPage(),
      '/shop_page':(context) => const ShopPage(),
      '/gift_page':(context) => const GiftPage(),
      '/discount_page':(context) => const DiscountPage(),
    },
    );
  }
}

