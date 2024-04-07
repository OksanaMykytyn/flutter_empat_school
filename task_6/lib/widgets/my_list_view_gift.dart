import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_6/models/shop.dart';
import 'package:task_6/widgets/my_gift_tile.dart';

class MyListViewGift extends StatelessWidget {
  const MyListViewGift({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<Shop>(
        builder: (BuildContext context, Shop value, Widget? child) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: value.gift.length,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) {
                final product = value.gift[index];
                return MyGiftTile(product: product);
              });
        },
      ),
    );
  }
}
