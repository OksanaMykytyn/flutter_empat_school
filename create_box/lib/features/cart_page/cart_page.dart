import 'package:create_box/components/app_bar/my_app_bar_for_another_page.dart';
import 'package:create_box/features/cart_page/components/product_tile_for_cart.dart';
import 'package:create_box/features/cart_page/components/product_tile_for_cart_for_wrapper.dart';
import 'package:create_box/components/for_content_of_page/buttons/my_yellow_button_for_order.dart';
import 'package:create_box/features/cart_page/bloc/cart_bloc.dart';
import 'package:create_box/features/cart_page/bloc/cart_event.dart';
import 'package:create_box/features/cart_page/bloc/cart_state.dart';
import 'package:create_box/features/order_page/order_page.dart';
import 'package:create_box/repository/bestsellers/models/box.dart';
import 'package:create_box/repository/bestsellers/order_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarForAnotherPage(title: 'Cart'),
      body: Container(
        //margin: EdgeInsets.all(16),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFD0D5FF), // #D0D5FF
              Color(0xFFFFF2DD), // #FFF2DD
            ],
            stops: [0.1203, 0.7025], // Gradient stops
            begin: Alignment.centerLeft, // Gradient start point
            end: Alignment.centerRight, // Gradient end point
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Theme.of(context).colorScheme.background),
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state.comics.isNotEmpty ||
                  state.sweet.isNotEmpty ||
                  state.wrapper != null) {
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'YOUR BOX',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                '${state.totalPrice.toStringAsFixed(2)} \$',
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Divider(
                              color: const Color(0xFF464646).withOpacity(0.8),
                              height: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (state.wrapper != null)
                      SliverList.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            final wrapper = state.wrapper!;
                            return ProductTileForCartForWrapper(
                              photoPath: wrapper.photoPath,
                              category: "Wrapper",
                              name: wrapper.name,
                              price: wrapper.price,
                              function: () {
                                context.goNamed('Constructor');
                              },
                            );
                          }),
                    SliverList.builder(
                        itemCount: state.comics.length,
                        itemBuilder: (context, index) {
                          final comics = state.comics[index];
                          return ProductTileForCart(
                            photoPath: comics.photoPath,
                            category: "Comics",
                            name: comics.name,
                            price: comics.price,
                            function: () {
                              BlocProvider.of<CartBloc>(context)
                                  .add(RemoveFromCartComics(comics: comics));
                            },
                          );
                        }),
                    SliverList.builder(
                        itemCount: state.sweet.length,
                        itemBuilder: (context, index) {
                          final sweet = state.sweet[index];
                          return ProductTileForCart(
                            photoPath: sweet.photoPath,
                            category: "Sweet",
                            name: sweet.name,
                            price: sweet.price,
                            function: () {
                              BlocProvider.of<CartBloc>(context)
                                  .add(RemoveFromCartSweet(sweet: sweet));
                            },
                          );
                        }),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyYellowButtonForOrder(
                                title: "CONFIRM ORDER",
                                function: () async {
                                  //context.goNamed('Order');
                                  // Питання користувачу про створення боксу
                                  bool createBox = await showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text('Create a new box?',
                                      style: Theme.of(context).textTheme.titleMedium,),
                                      content: Text(
                                          'Do you want to create a new box with the selected comics, sweets, and wrapper?',
                                          style: Theme.of(context).textTheme.titleMedium,),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(true),
                                          child: Text('Yes', style: Theme.of(context).textTheme.titleMedium,),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(false),
                                          child: Text('No', style: Theme.of(context).textTheme.titleMedium,),
                                        ),
                                      ],
                                    ),
                                  );

                                  if (createBox) {
                                    if (state.comics.isNotEmpty &&
                                        state.sweet.isNotEmpty &&
                                        state.wrapper != null) {
                                      double totalAmount = state.totalPrice;

                                      // Generate the box
                                      Box newBox = Box(
                                        id: 100,
                                        name: 'New Box',
                                        description: 'A new box',
                                        price: totalAmount,
                                        photoPath: 'assets/images/new_box.jpg',
                                        wrapper: state.wrapper!,
                                        comics: state.comics,
                                        sweets: state.sweet,
                                      );
                                      print(newBox);

                                      int? boxId = await OrderRepository()
                                          .createBox(newBox);

                                      if (boxId != null) {
                                        // Navigate to OrderPage and pass the box ID
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                OrderPage(id: boxId),
                                          ),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Failed to create the box. Please try again.',
                                                style: Theme.of(context).textTheme.titleMedium,),
                                          ),
                                        );
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              'Please add comics, sweets, and wrapper to create the box.',
                                              style: Theme.of(context).textTheme.titleMedium,),
                                        ),
                                      );
                                    }
                                  }
                                })
                          ],
                        ),
                      ),
                    )
                  ],
                );
              } else {
                return Center(child: Text('Cart is empty',
                style: Theme.of(context).textTheme.titleMedium,));
              }
            },
          ),
        ),
      ),
    );
  }
}
