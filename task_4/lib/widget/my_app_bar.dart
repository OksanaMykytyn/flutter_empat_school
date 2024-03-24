import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: const Text('CUSTOM UNION',
        style: TextStyle(color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 20),),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      );
  }
}