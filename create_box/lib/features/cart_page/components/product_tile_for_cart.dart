import 'package:create_box/features/cart_page/components/delete_product.dart';
import 'package:flutter/material.dart';

class ProductTileForCart extends StatelessWidget {
  const ProductTileForCart(
      {super.key,
      required this.photoPath,
      required this.category,
      required this.name,
      required this.price,
      required this.function});

  final String photoPath;
  final String category;
  final String name;
  final double price;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Flexible(
              //fit: FlexFit.tight,
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x003426cf)
                              .withOpacity(0.1), // Shadow color with opacity
                          offset: const Offset(0, 0), // Shadow offset (x, y)
                          blurRadius: 6.0, // Shadow blur radius
                          spreadRadius: 4.0, // Shadow spread radius
                        ),
                      ],
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: const Image(
                            image: AssetImage('images/comics.png'))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Flexible(
                      flex: 3,
                      child: SizedBox(
                        width: 200,
                        child: Text(
                          "$category: $name",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${price.toStringAsFixed(2)} \$",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: DeleteProduct(function: function),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
