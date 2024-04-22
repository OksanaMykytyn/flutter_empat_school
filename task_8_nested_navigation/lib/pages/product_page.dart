import 'package:flutter/material.dart';
import 'package:task_6/widgets/my_appbar.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(title: 'Про продукт'),
      body: Center(child: Text('information'),),
    );
  }
}