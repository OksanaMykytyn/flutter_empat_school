import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_6/models/lists/lists.dart';
import 'package:task_6/models/shop.dart';
import 'package:task_6/widgets/my_product_tile.dart';

class MyListViewProduct extends StatelessWidget {
  const MyListViewProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<Shop>(
        builder: (BuildContext context, Shop value, Widget? child) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: lists[value.selectedCategory].length,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) {
                final list = lists[value.selectedCategory];
                final product = list[index];
                return MyProductTile(product: product);
              });
        },
      ),
    );
  }
}
