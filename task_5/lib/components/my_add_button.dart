import 'package:flutter/material.dart';
import 'package:task_5/colors.dart';

class MyAddButton extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;

  const MyAddButton({super.key, required this.onTap,
  required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: mywhitepink,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(4),
        child: child,
      ),
    );
  }
}