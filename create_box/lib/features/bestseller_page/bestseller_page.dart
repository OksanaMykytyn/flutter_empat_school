import 'package:create_box/components/app_bar/my_app_bar_for_another_page.dart';
import 'package:create_box/components/for_content_of_page/about_photo.dart';
import 'package:create_box/components/for_content_of_page/buttons/my_blue_button_for_order.dart';
import 'package:create_box/components/for_content_of_page/cards/my_card_for_bestsellers.dart';
import 'package:create_box/components/for_content_of_page/title_for_page.dart';
import 'package:create_box/features/cart_page/bloc/cart_bloc.dart';
import 'package:create_box/features/cart_page/bloc/cart_event.dart';
import 'package:create_box/features/order_page/order_page.dart';
import 'package:create_box/repository/bestsellers/models/box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestsellerPage extends StatelessWidget {
  const BestsellerPage({super.key, required this.box});
  final Box box;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarForAnotherPage(
        title: 'About bestseller',
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
                  child: Text(box.name,
                  style: Theme.of(context).textTheme.titleMedium,),
                ),
                Text('${box.price.toStringAsFixed(2)} \$',
                style: Theme.of(context).textTheme.titleMedium,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                  child: Text(softWrap: true, "     ${box.description}",
                  style: Theme.of(context).textTheme.titleMedium,),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: MyBlueButtonForOrder(
                      title: "Order",
                      function: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderPage(id: box.id),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(
                height: 2.0,
                color: Colors.grey[400],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: TitleForPage(title: 'Comics'),
            ),
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 270, // Adjust the height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: box.comics.length,
              itemBuilder: (context, index) {
                final comics = box.comics[index];
                return MyCardForBestsellers(
                  photoPath: comics.photoPath,
                  name: comics.name,
                  description: comics.description,
                  price: comics.price,
                  function: () {
                    context
                        .read<CartBloc>()
                        .add(AddToCartComics(comics: comics));
                  },
                );
              },
            ),
          )),
          const SliverToBoxAdapter(
            child: TitleForPage(title: 'Sweet'),
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 270, // Adjust the height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: box.sweets.length,
              itemBuilder: (context, index) {
                final sweet = box.sweets[index];
                return MyCardForBestsellers(
                  photoPath: sweet.photoPath,
                  name: sweet.name,
                  description: sweet.description,
                  price: sweet.price,
                  function: () {
                    context.read<CartBloc>().add(AddToCartSweet(sweet: sweet));
                  },
                );
              },
            ),
          ))
        ],
      ),
    );
  }
}
