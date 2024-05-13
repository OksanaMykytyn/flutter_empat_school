import 'package:create_box/components/app_bar/my_app_bar_for_another_page.dart';
import 'package:create_box/components/for_content_of_page/about_photo.dart';
import 'package:create_box/components/for_content_of_page/buttons/my_blue_button_for_order.dart';
import 'package:create_box/features/cart_page/bloc/cart_bloc.dart';
import 'package:create_box/features/cart_page/bloc/cart_event.dart';
import 'package:create_box/repository/bestsellers/models/comics.dart';
import 'package:create_box/repository/bestsellers/models/sweet.dart';
import 'package:create_box/repository/bestsellers/models/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatelessWidget {
  const ProductPage(
      {super.key,
      required this.name,
      required this.description,
      required this.price,
      required this.photoPath,
      required this.isComics,
      required this.isSweet,
      required this.id});
  final String name;
  final String description;
  final double price;
  final String photoPath;
  final bool isComics;
  final bool isSweet;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarForAnotherPage(
        title: 'About product',
      ),
      body: CustomScrollView(
        slivers: [
          const AboutPhoto(),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Text(
                  "$price \$",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10.0),
                  child: Text(
                      style: Theme.of(context).textTheme.titleMedium,
                      softWrap: true,
                      "     $description"),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: MyBlueButtonForOrder(
                      title: "Add to cart",
                      function: () {
                        if (isComics) {
                          BlocProvider.of<CartBloc>(context).add(
                              AddToCartComics(
                                  comics: Comics(
                                      description: description,
                                      id: id,
                                      name: name,
                                      price: price,
                                      photoPath: photoPath)));
                        } else if (isSweet) {
                          BlocProvider.of<CartBloc>(context).add(AddToCartSweet(
                              sweet: Sweet(
                                  description: description,
                                  id: id,
                                  name: name,
                                  price: price,
                                  photoPath: photoPath)));
                        } else {
                          BlocProvider.of<CartBloc>(context).add(
                              AddToCartWrapper(
                                  wrapper: Wrapper(
                                      description: description,
                                      id: id,
                                      name: name,
                                      price: price,
                                      photoPath: photoPath)));
                        }
                        //BlocProvider.of<CartBloc>(context).add(Add)
                      }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
