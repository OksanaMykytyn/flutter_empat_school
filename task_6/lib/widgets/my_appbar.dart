import 'package:flutter/material.dart';
import 'package:task_6/theme.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.title});
  final String title;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: mywhitepink,
      centerTitle: true,
      backgroundColor: myblue,
      title: Text(title),
    );
  }
}
