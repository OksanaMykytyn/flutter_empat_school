import 'package:flutter/material.dart';

class MyTileYear extends StatelessWidget {
  MyTileYear({super.key, required this.title, required this.onTap});
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(title,
        style: Theme.of(context).textTheme.titleLarge,),
      ),
    );
  }
}