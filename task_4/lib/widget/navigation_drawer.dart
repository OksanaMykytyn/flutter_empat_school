import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_4/pages/settings.dart';
import 'package:task_4/pages/home.dart';
import 'package:task_4/pages/likes.dart';
import 'package:task_4/pages/profile.dart';
import 'package:task_4/pages/search.dart';

class MyNavigationDrawer extends StatelessWidget {
  const MyNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
}

Widget buildHeader(BuildContext context) => Container(
  color: Theme.of(context).primaryColor,
  padding: EdgeInsets.only(
    top: MediaQuery.of(context).padding.top,
  ),
  child: const Padding(
    padding: EdgeInsets.symmetric(vertical: 30),
    child: Column(
      children: [
        CircleAvatar(
          radius: 52,
          backgroundImage: NetworkImage('https://scontent.cdninstagram.com/v/t51.29350-15/339667808_560702222831423_5540622135281505998_n.jpg?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xNDQweDE0NDAuc2RyIn0&_nc_ht=scontent.cdninstagram.com&_nc_cat=111&_nc_ohc=Y_kbnrDj_xMAX-UngMD&edm=APs17CUBAAAA&ccb=7-5&ig_cache_key=MzA3MzYzMjQwMTM3NTc0Mjc4Ng%3D%3D.2-ccb7-5&oh=00_AfAMQsdbhCy_bSzER5Hp5e0oTq2tBC1VtbygAuCLFS7RjQ&oe=66027C4D&_nc_sid=10d13b'),
        ),
        SizedBox(height: 12,),
        Text("CUSTOM UNION",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),),
        Text("Create your sneakers",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),),
    ],),
  ),
);

Widget buildMenuItems(BuildContext context) => Container(
  padding: const EdgeInsets.all(24),
  child: Wrap(
      runSpacing: 16,
      children: [
        ListTile(
          leading: const Icon(Icons.home_rounded),
          title: const Text('Home'),
          onTap: () => 
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const Home())),
        ),
        ListTile(
          leading: const Icon(Icons.search_rounded),
          title: const Text('Search'),
          onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const Search()));},
        ),
        ListTile(
          leading: const Icon(Icons.favorite_border_rounded),
          title: const Text('Likes'),
          onTap: () => 
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const Likes())),
        ),
        ListTile(
          leading: const Icon(Icons.account_circle_rounded),
          title: const Text('Profile'),
          onTap: () => 
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const Profile())),
        ),
        const Divider(color: Colors.black54,),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {
          Navigator.pop(context);

          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const Settings()));

          }
        ),
      ],
    ),
);

}