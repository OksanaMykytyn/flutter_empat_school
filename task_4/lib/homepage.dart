import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:task_4/pages/home.dart';
import 'package:task_4/pages/likes.dart';
import 'package:task_4/pages/profile.dart';
import 'package:task_4/pages/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  List<Widget> tabs = [
    const Home(),
    const Search(),
    const Likes(),
    const Profile(),
  ];
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: tabs.length, vsync: this);
    _controller.addListener(() {
      setState(() {
        _currentIndex = _controller.index;
      });
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _controller,
        children: const [Home(),
                  Search(),
                  Likes(),
                  Profile(),]
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        backgroundColor: Theme.of(context).primaryColor,
        overlayColor: Colors.black,
        overlayOpacity: 0.4,
        spacing: 12,
        spaceBetweenChildren: 12,
        closeManually: false,
        children: [
          SpeedDialChild(
          child: const Icon(Icons.call),
          backgroundColor: Colors.white,
          label: 'Call',
          onTap: () {},
        ),
        SpeedDialChild(
          child: const Icon(Icons.telegram_rounded),
          backgroundColor: Colors.white,
          label: 'Telegram',
          onTap: () {}
        ),
        SpeedDialChild(
          child: const Icon(Icons.email_rounded),
          backgroundColor: Colors.white,
          label: 'Email',
          onTap: () {}
        ),
        SpeedDialChild(
          child: const Icon(Icons.sms_rounded),
          backgroundColor: Colors.white,
          label: 'SMS',
          onTap: () {}
        ),
        ],
        ),
      bottomNavigationBar: Container(
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 10.0),
          child: GNav(
            selectedIndex: _currentIndex,
            onTabChange: (index) {
              setState(() {
                _currentIndex = index;
                _controller.animateTo(index);
              });
            },
            backgroundColor: Theme.of(context).primaryColor,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.amberAccent.shade700,
            gap: 8,
            padding: const EdgeInsets.all(10),
            tabs: const [
              GButton(
                icon: Icons.home_rounded,
                text: 'Home'),
              GButton(
                icon: Icons.search_rounded,
                text: 'Search'),
              GButton(
                icon: Icons.favorite_border_rounded,
                text: 'Likes'),
              GButton(
                icon: Icons.account_circle,
                text: 'Profile'),            
            ],
          ),
        ),
      ),
    );
  
  }

  
}