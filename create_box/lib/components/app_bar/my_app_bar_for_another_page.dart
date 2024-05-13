import 'package:flutter/material.dart';

class MyAppBarForAnotherPage extends StatelessWidget
    implements PreferredSizeWidget {
  const MyAppBarForAnotherPage({super.key, required this.title});
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
      centerTitle: true,
      elevation: 0,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      title: Text(title),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary, // #D0D5FF
              Theme.of(context).colorScheme.onPrimary, // #FFF2DD
            ],
            stops: [0.1203, 0.7025], // Gradient stops
            begin: Alignment.centerLeft, // Gradient start point
            end: Alignment.centerRight, // Gradient end point
          ),
        ),
      ),
    );
  }
}
