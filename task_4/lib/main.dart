import 'package:flutter/material.dart';
import 'package:task_4/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CUSTOM UNION',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 255, 185, 45),
      ),
      home: const HomePage(),
    );
  }
}


