import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_6/models/lists/class_product.dart';
import 'package:task_6/models/shop.dart';
import 'package:task_6/theme.dart';
import 'package:task_6/widgets/my_add_button.dart';

class MyProductTile extends StatelessWidget {
  const MyProductTile({super.key, required this.product});
    final Product product;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: myblue,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                    MyAddButton(onTap: () {
                      Provider.of<Shop>(context, listen: false).addThisProductToGift(product);
                    }, 
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