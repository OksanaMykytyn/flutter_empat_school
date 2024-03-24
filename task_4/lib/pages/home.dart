import 'package:flutter/material.dart';
import 'package:task_4/widget/navigation_drawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CUSTOM UNION',
        style: TextStyle(color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 20),),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: const MyNavigationDrawer(),
      body: const Center(child: Text('Home'),
      ),
    );
  }
}