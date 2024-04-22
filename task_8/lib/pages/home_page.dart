import 'package:flutter/material.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:task_6/pages/discount_page.dart';
import 'package:task_6/pages/gift_page.dart';
import 'package:task_6/pages/list_comments.dart';
import 'package:task_6/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  void onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(selectedIndex,
        duration: const Duration(milliseconds: 400), curve: Curves.easeOutQuad);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: PageView(
          scrollDirection: Axis.horizontal,
          onPageChanged: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          controller: _pageController,
          children: const [
            ShopPage(),
            GiftPage(),
            DiscountPage(),
            ListComments()
          ],
        ),
      ),
      bottomNavigationBar: SlidingClippedNavBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconSize: 24,
        selectedIndex: selectedIndex,
        onButtonPressed: onButtonPressed,
        activeColor: Theme.of(context).colorScheme.background,
        barItems: <BarItem>[
          BarItem(
            icon: Icons.shopping_bag_outlined,
            title: 'Головна',
          ),
          BarItem(
            icon: Icons.shopping_cart_outlined,
            title: 'Боксик',
          ),
          BarItem(
            icon: Icons.discount_outlined,
            title: 'Знижки',
          ),
          BarItem(
            icon: Icons.reviews_rounded,
            title: 'Відгуки',
          ),
        ],
      ),
    );
  }
}
