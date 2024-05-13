import 'package:create_box/components/for_content_of_page/cards/my_card.dart';
import 'package:create_box/features/cart_page/bloc/cart_bloc.dart';
import 'package:create_box/features/cart_page/bloc/cart_event.dart';
import 'package:create_box/features/constructor_page/bloc/constructor_bloc.dart';
import 'package:create_box/features/constructor_page/bloc/constructor_event.dart';
import 'package:create_box/features/constructor_page/bloc/constructor_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyConstructorSweets extends StatelessWidget {
  const MyConstructorSweets({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConstructorBloc, ConstructorState>(
      bloc: ConstructorBloc()..add(LoadSweetsList()),
      builder: (context, state) {
        if (state is SweetsListLoaded) {
          final sweetsList = state.sweetsList;
          return SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.56,
              crossAxisCount: 2,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              final sweet = sweetsList[index];
              return MyCard(
                isComics: false,
                id: sweet.id,
                price: sweet.price,
                photoPath: sweet.photoPath,
                description: sweet.description,
                name: sweet.name,
                function: () {
                  BlocProvider.of<CartBloc>(context)
                      .add(AddToCartSweet(sweet: sweet));
                },
              );
            }, childCount: sweetsList.length),
          );
        } else if (state is SweetsListLoading) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text('Error loading best sellers'),
            ),
          );
        }
      },
    );
  }
}
