import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_6/models/lists/class_product.dart';
import 'package:task_6/models/shop.dart';
import 'package:task_6/theme.dart';
import 'package:task_6/widgets/my_add_button.dart';

class MyGiftTile extends StatelessWidget {
  const MyGiftTile({super.key, required this.product});
  final Product product;

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
                image: AssetImage(product.image),
                width: 100,
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      product.name,
                      style: TextStyle(
                          color: mywhitepink,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(
                    product.desc,
                    style: TextStyle(
                      color: mywhitepink,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.price.toStringAsFixed(2),
                        style: TextStyle(
                          color: mywhitepink,
                          fontSize: 12,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: MyAddButton(
                            onTap: () {
                              Provider.of<Shop>(context, listen: false).removeThisProductToGift(product);
                            },
                            child: const Icon(Icons.remove, size: 24)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
