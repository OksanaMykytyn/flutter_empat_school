import 'package:flutter/material.dart';
import 'package:task_4/item/product.dart';

class ItemSneakers extends StatelessWidget {
  const ItemSneakers({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title,
        style:  const TextStyle(color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 20),),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                transitionOnUserGestures: true,
                tag: product,
                child: Image(image: AssetImage(product.assets),
                height: 300,
                width: 300,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Text('This page about ${product.title}')
            ],
          ),
        ),
      ],),
    );
  }
}