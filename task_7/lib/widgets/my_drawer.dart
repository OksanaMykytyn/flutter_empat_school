import 'package:flutter/material.dart';
import 'package:task_6/widgets/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
      child: Column(
        children: [
          DrawerHeader(
              child: Center(
            child: Column(
              children: [
                Icon(
                  Icons.shopping_bag_rounded,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'ManhwaShop',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
          )),
          const SizedBox(
            height: 25,
          ),
          MyListTile(
              text: 'Магазинчик',
              icon: Icons.shopping_bag_outlined,
              onTap: () => Navigator.pop(context)),
          MyListTile(
              text: 'Зібраний бокс',
              icon: Icons.shopping_cart_outlined,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/gift_page');
              }),
          MyListTile(
              text: 'Отримати знижку',
              icon: Icons.discount_outlined,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/discount_page');
              }),
              MyListTile(
              text: 'Відгуки',
              icon: Icons.reviews_outlined,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/list_comments');
              }),
        ],
      ),
    );
  }
}
