import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    widget.navigationShell.goBranch(index,
        initialLocation: index == widget.navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    const List<TabItem> items = [
      TabItem(icon: EvaIcons.homeOutline, title: 'Home'),
      TabItem(
        icon: EvaIcons.giftOutline,
        title: 'Constructor',
      ),
      TabItem(
        icon: EvaIcons.settings2Outline,
        title: 'Settings',
      ),
    ];
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: widget.navigationShell),
        ],
      ),
      bottomNavigationBar: BottomBarFloating(
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey.shade200
                  .withOpacity(0.2), // Adjust color as needed
              blurRadius: 10.0, // Adjust blur radius
              offset: const Offset(0, 4), // Adjust shadow offset
            )
          ],
          titleStyle: Theme.of(context).textTheme.labelSmall,
          //borderRadius: BorderRadius.circular(24),
          items: items,
          backgroundColor: Theme.of(context).colorScheme.background,
          color: Theme.of(context).colorScheme.onSecondary,
          colorSelected: Theme.of(context).colorScheme.secondary,
          indexSelected: selectedIndex,
          onTap: onButtonPressed),
    );
  }
}
