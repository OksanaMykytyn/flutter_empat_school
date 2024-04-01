import 'package:flutter/material.dart';
import 'package:task_5/colors.dart';
import 'package:task_5/components/my_drawer.dart';
import 'package:task_5/components/my_product_tile.dart';
import 'package:task_5/data/product.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key, 
  required this.giftLength,
  required this.priceGift, 
  required this.addProductToGift});

  final Function addProductToGift;
  final int giftLength;
  final double priceGift;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mywhitepink,
      appBar: AppBar(
        foregroundColor: mywhitepink,
        centerTitle: true,
        backgroundColor: myblue,
        title: const Text("Магазинчик"),
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              decoration: BoxDecoration(
                color: myblue,
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Text('Кількість предметів: $giftLength Cума: ${priceGift.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: const Color(0xfff6edff),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),),
                ],
              ),
              ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: products.length,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) {
                final product = products[index];
                return MyProductTile(product: product, 
                add: () {
                  addProductToGift(product);
                });
              }
              ),
          ),
        ],),
    );
  }
}