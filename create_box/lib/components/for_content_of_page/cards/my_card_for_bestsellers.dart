import 'package:create_box/components/for_content_of_page/buttons/my_blue_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyCardForBestsellers extends StatelessWidget {
  const MyCardForBestsellers(
      {super.key,
      required this.photoPath,
      required this.name,
      required this.description,
      required this.price,
      required this.function});

  final String photoPath;
  final String name;
  final String description;
  final double price;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              context.goNamed('Product');
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x003426cf)
                        .withOpacity(0.2), // Shadow color with opacity
                    offset: const Offset(0, 0), // Shadow offset (x, y)
                    blurRadius: 12.0, // Shadow blur radius
                    spreadRadius: 4.0, // Shadow spread radius
                  ),
                ],
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: const Image(
                    image: AssetImage(
                      'images/comics.png',
                    ),
                    height: 70,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 2.0),
            child: Text(
              name,
              maxLines: 2,
              softWrap: true,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Text(
            '$price \$',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: MyBlueButton(
              title: 'ADD TO CART',
              function: function,
            ),
          )
        ],
      ),
    );
  }
}
