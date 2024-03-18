import 'package:flutter/material.dart';
import 'package:task_3/pages/add.dart';
import 'package:task_3/pages/home.dart';
import 'package:task_3/pages/profile.dart';
import 'package:task_3/pages/reels.dart';
import 'package:task_3/pages/search.dart';

class HomePage extends StatefulWidget{
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage>{
  int _selectedIndex = 0;
  
  void _navigateBottomNavBar(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

  final List<Widget> _children = [
    UserHome(),
    UserSearch(),
    UserAdd(),
    UserReals(),
    UserProfile(),
  ];  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomNavBar,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: 'add'),
          BottomNavigationBarItem(icon: Icon(Icons.slideshow_outlined), label: 'reels'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'profile'),
          ],
        ),
    );
  }

  
}