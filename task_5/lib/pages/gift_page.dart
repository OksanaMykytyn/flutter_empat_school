import 'package:flutter/material.dart';
import 'package:task_5/colors.dart';
import 'package:task_5/components/my_gift_tile.dart';
import 'package:task_5/data/product.dart';

class GiftPage extends StatelessWidget {
  const GiftPage({super.key, required this.removeProductToGift, required this.gift});

  final Function removeProductToGift;
  final List<Product> gift;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mywhitepink,
      appBar: AppBar(
        foregroundColor: mywhitepink,
        centerTitle: true,
        backgroundColor: myblue,
        title: const Text("Зібраний боксик"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: gift.length,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) {
                final product = gift[index];
                  return MyGiftTile(product: product, 
                  removeProductToGift: () {
                    removeProductToGift(product);
                  },);
              }
              ),
              ),
        ],),
    );
  }
}