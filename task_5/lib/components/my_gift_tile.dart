import 'package:flutter/material.dart';
import 'package:task_5/colors.dart';
import 'package:task_5/components/my_add_button.dart';
import 'package:task_5/data/product.dart';

class MyGiftTile extends StatelessWidget {
  final Product product;
  final void Function()? removeProductToGift;

  const MyGiftTile({super.key,
  required this.product, 
  required this.removeProductToGift});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: myblue,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image(
              image: AssetImage(product.image), width: 100,)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(product.name,
                    style: TextStyle(
                      color: mywhitepink,
                      fontSize: 14,
                      fontWeight: FontWeight.w700
                    ),),
                  ),
                  Text(product.desc,
                  style: TextStyle(
                      color: mywhitepink,
                      fontSize: 12,
                    ),),
                    const SizedBox(height: 4,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.price.toStringAsFixed(2),
                        style: TextStyle(
                              color: mywhitepink,
                              fontSize: 12,
                            ),),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: MyAddButton(onTap: removeProductToGift, 
                            child: const Icon(Icons.remove, size: 24)),
                        ),    
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],),
    );
  }
}