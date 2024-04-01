import 'package:flutter/material.dart';
import 'package:task_5/data/product.dart';
import 'package:task_5/data/shop.dart';
import 'package:task_5/pages/gift_page.dart';
import 'package:task_5/pages/intro_page.dart';
import 'package:task_5/pages/shop_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Shop shop = Shop();

  void addProductToGift(Product product) {
  setState(() {
    shop.gift.add(product);
    shop.sumAllproducts += product.price;
  });
  }

  void removeProductToGift(Product product) {
    setState(() {
    shop.gift.remove(product);
    shop.sumAllproducts -= product.price;
  });
 }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const IntroPage(),
      routes: {
        '/intro_page':(context) => const IntroPage(),
        '/shop_page':(context) => ShopPage(
          giftLength: shop.lengthGift(), 
          priceGift: shop.sumAllproducts, addProductToGift: addProductToGift,),
        '/gift_page':(context) => GiftPage(
          removeProductToGift: removeProductToGift, 
          gift: shop.gift,),
      },
    );
  }
}
