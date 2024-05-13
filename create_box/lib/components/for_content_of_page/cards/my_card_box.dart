import 'package:create_box/features/cart_page/bloc/cart_bloc.dart';
import 'package:create_box/features/cart_page/bloc/cart_event.dart';
import 'package:create_box/features/cart_page/bloc/cart_state.dart';
import 'package:create_box/features/product_page/product_page.dart';
import 'package:create_box/repository/bestsellers/models/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCardBox extends StatelessWidget {
  const MyCardBox({super.key, required this.wrapper});

  final Wrapper wrapper;
  /* final String photoPath;
  final String name;
  final String description;
  final double price; */

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductPage(
                id: wrapper.id,
                name: wrapper.name,
                description: wrapper.description,
                photoPath: wrapper.photoPath,
                price: wrapper.price,
                isComics: false,
                isSweet: false),
          ),
        );
      },
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          final isWrapper = (state.wrapper == null) ? false : true;
          return Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<CartBloc>(context)
                        .add(AddToCartWrapper(wrapper: wrapper));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      border: (isWrapper && state.wrapper!.name == wrapper.name)
                          ? Border.all(
                              color: Colors.deepPurple, // Dark purple color
                              width: 5.0, // Border width in pixels
                            )
                          : const Border(),
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
                        child:
                            const Image(image: AssetImage('images/box.jfif'))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 2.0),
                  child: Text(
                    wrapper.name,
                    maxLines: 2,
                    softWrap: true,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                Text(
                  '${wrapper.price} \$',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
