import 'package:flutter/material.dart';

class MyYellowButtonForOrder extends StatelessWidget {
  const MyYellowButtonForOrder(
      {super.key, required this.title, required this.function});
  final String title;
  final void Function()? function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color(0xFFFDF2DD), // background: rgba(255, 242, 221, 1)
          border: Border.all(
            color: const Color(
                0xFFD0D5FF), // border: 4px solid rgba(208, 213, 255, 1)
            width: 4.0,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0x003426cf).withOpacity(
                  0.2), // box-shadow: 0px 0px 20px 4px rgba(52, 38, 207, 0.2)
              offset: const Offset(0, 0),
              blurRadius: 20.0,
              spreadRadius: 4.0,
            ),
          ],
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
