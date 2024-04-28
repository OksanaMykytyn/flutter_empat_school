import 'package:flutter/material.dart';

class MyComment extends StatelessWidget {
  const MyComment({super.key, required this.name, required this.body});
  final String name;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Theme.of(context).colorScheme.primary,
      ),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Text("Name: $name",
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.start,),
          const SizedBox(height: 12,),
          Text("Comment: $body",
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.start,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,)
        ],),
    );
  }
}