import 'package:create_box/components/for_content_of_page/cards/my_card_box.dart';
import 'package:create_box/features/constructor_page/bloc/constructor_bloc.dart';
import 'package:create_box/features/constructor_page/bloc/constructor_event.dart';
import 'package:create_box/features/constructor_page/bloc/constructor_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyConstructorWrappers extends StatelessWidget {
  const MyConstructorWrappers({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConstructorBloc, ConstructorState>(
      bloc: ConstructorBloc()..add(LoadWrappersList()),
      builder: (context, state) {
        if (state is WrappersListLoaded) {
          final wrappersList = state.wrappersList;
          return SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.7,
              crossAxisCount: 2,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              final wrapper = wrappersList[index];
              return MyCardBox(
                wrapper: wrapper,
              );
            }, childCount: wrappersList.length),
          );
        } else if (state is WrappersListLoading) {
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
