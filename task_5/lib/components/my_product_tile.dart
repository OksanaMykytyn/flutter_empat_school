import 'package:flutter/material.dart';
import 'package:task_5/colors.dart';
import 'package:task_5/components/my_add_button.dart';
import 'package:task_5/data/product.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  final void Function()? add;

  MyProductTile({super.key,
  required this.product,
  required this.add});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: myblue,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image(
              image: AssetImage(product.image))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                      child: Text(product.name,
                      style: TextStyle(
                        color: mywhitepink,
                        fontSize: 18,
                        fontWeight: FontWeight.w700
                      ),),
                    ),
                    Text(product.desc,
                    style: TextStyle(
                        color: mywhitepink,
                        fontSize: 14,
                      ),),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(product.price.toStringAsFixed(2),
                      style: TextStyle(
                            color: mywhitepink,
                            fontSize: 14,
                          ),),
                    ),
                    const SizedBox(height: 25,),    
                    MyAddButton(onTap: add, 
                    child: const Icon(Icons.add_rounded, size: 24)),    
                  ],
                ),
              ),
            ],
          ),
        ],),
    );
  }
}