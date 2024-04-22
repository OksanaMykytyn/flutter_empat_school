import 'package:flutter/material.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
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
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutQuad);
    }

    return SlidingClippedNavBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      iconSize: 24,
      selectedIndex: selectedIndex,
      onButtonPressed: onButtonPressed,
      activeColor: Theme.of(context).colorScheme.secondary,
      barItems: <BarItem>[
        BarItem(
          icon: Icons.event,
          title: 'Events',
        ),
        BarItem(
          icon: Icons.search_rounded,
          title: 'Search',
        ),
        BarItem(
          icon: Icons.bolt_rounded,
          title: 'Energy',
        ),
        BarItem(
          icon: Icons.tune_rounded,
          title: 'Settings',
        ),
      ],
    );
  }
}
