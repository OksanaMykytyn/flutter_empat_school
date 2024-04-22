import 'package:flutter/material.dart';
import 'package:task_6/models/lists/class_product.dart';
import 'package:task_6/widgets/my_own_product_tile.dart';

class MyOwnProductList extends StatelessWidget {
  const MyOwnProductList({super.key, required this.myPtoduct});
  final List<Product> myPtoduct;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: myPtoduct.length,
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index) {
            final product = myPtoduct[index];
            return MyOwnProductTile(product: product);
          }),
    );
  }
}
