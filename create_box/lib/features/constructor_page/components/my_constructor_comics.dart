import 'package:create_box/components/for_content_of_page/cards/my_card.dart';
import 'package:create_box/features/cart_page/bloc/cart_bloc.dart';
import 'package:create_box/features/cart_page/bloc/cart_event.dart';
import 'package:create_box/features/constructor_page/bloc/constructor_bloc.dart';
import 'package:create_box/features/constructor_page/bloc/constructor_event.dart';
import 'package:create_box/features/constructor_page/bloc/constructor_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyConstructorComics extends StatelessWidget {
  const MyConstructorComics({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConstructorBloc, ConstructorState>(
      bloc: ConstructorBloc()..add(LoadComicsList()),
      builder: (context, state) {
        if (state is ComicsListLoaded) {
          final comicsList = state.comicsList;
          return SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.56,
              crossAxisCount: 2,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              final comics = comicsList[index];
              return MyCard(
                isComics: true,
                id: comics.id,
                photoPath: comics.photoPath,
                name: comics.name,
                description: comics.description,
                price: comics.price,
                function: () {
                  BlocProvider.of<CartBloc>(context)
                      .add(AddToCartComics(comics: comics));
                },
              );
            }, childCount: 10),
          );
        } else if (state is ComicsListLoading) {
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
