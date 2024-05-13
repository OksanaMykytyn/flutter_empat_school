import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyAppBarForMainPage extends StatelessWidget
    implements PreferredSizeWidget {
  const MyAppBarForMainPage({super.key, required this.title});
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
      centerTitle: true,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      title: Text(title),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: IconButton(
            icon: const Icon(EvaIcons.shoppingCartOutline),
            onPressed: () => context.goNamed('Cart'),
          ),
        )
      ],
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary, // #D0D5FF
              Theme.of(context).colorScheme.onPrimary, // #FFF2DD
            ],
            stops: [0.1203, 0.7025], // Gradient stops
            begin: Alignment.topLeft, // Gradient start point
            end: Alignment.bottomRight, // Gradient end point
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.2), // Box shadow color
              offset: const Offset(0, 0), // Box shadow offset
              blurRadius: 20, // Box shadow blur radius
              spreadRadius: 6, // Box shadow spread radius
            ),
          ],
        ),
      ),
    );
  }
}
