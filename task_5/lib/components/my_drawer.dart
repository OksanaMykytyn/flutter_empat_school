import 'package:flutter/material.dart';
import 'package:task_5/colors.dart';
import 'package:task_5/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: mywhitepink,
      child: Column(
        children: [
          DrawerHeader(
            child: Center(
              child: Column(
                children: [
                  Icon(Icons.shopping_bag_rounded,
                  size: 80,
                  color: myblue,),
                  const SizedBox(height: 15,),
                  Text('ManhwaShop',
                  style: TextStyle(
                    color: myblue,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),),
                ],
              ),              
            )
            ),
            const SizedBox(height: 25,),
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
              })
        ],),
    );
  }
}