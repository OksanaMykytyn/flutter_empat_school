import 'package:flutter/material.dart';

class ProfileTab1 extends StatelessWidget {
  final List<String> UserPosts = [];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 15,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), 
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            color: Colors.pink[100],
            ),
          );
      });
  }
}