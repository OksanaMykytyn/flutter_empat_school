import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class DeleteProduct extends StatelessWidget {
  const DeleteProduct({super.key, this.function});

  final Function()? function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        padding: const EdgeInsets.all(2),
        height: 20,
        width: 20,
        decoration: BoxDecoration(
            color: const Color(0xFFD0D5FF),
            borderRadius: BorderRadius.circular(4)),
        child: const Icon(
          EvaIcons.minus,
          size: 14,
        ),
      ),
    );
  }
}
