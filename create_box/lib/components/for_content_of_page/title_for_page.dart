import 'package:flutter/material.dart';

class TitleForPage extends StatelessWidget {
  const TitleForPage({
    super.key,
    required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
