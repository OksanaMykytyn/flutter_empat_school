import 'package:flutter/material.dart';
import 'package:task_6/theme.dart';
import 'package:task_6/widgets/my_appbar.dart';
import 'package:task_6/widgets/my_list_view_gift.dart';

class GiftPage extends StatelessWidget {
  const GiftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mywhitepink,
      appBar: const MyAppBar(title: "Зібраний боксик"),
      body: const Column(
        children: [
          MyListViewGift(),
        ],),
    );
  }
}