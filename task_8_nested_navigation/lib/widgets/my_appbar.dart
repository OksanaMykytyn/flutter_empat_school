import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_6/theme/darkThemeProvider.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.title});
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return AppBar(
      foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
      centerTitle: true,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      title: Text(title),
      actions: [
        IconButton(
          onPressed: () => {themeChange.darkTheme = !themeChange.darkTheme}, // Toggle theme using provider
          icon: Icon(
              themeChange.darkTheme ? Icons.light_mode : Icons.dark_mode), // Dynamic icon based on theme
        ),
      ],
    );
  }
}
