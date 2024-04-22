import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.navigationShell});
    final StatefulNavigationShell navigationShell;


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  void onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
    _goToBranch(selectedIndex);
  }

  void _goToBranch(int index) {
    widget.navigationShell.goBranch(index, initialLocation: index == widget.navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: widget.navigationShell
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
