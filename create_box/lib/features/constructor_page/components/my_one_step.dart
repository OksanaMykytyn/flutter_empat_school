import 'package:create_box/features/cart_page/bloc/cart_bloc.dart';
import 'package:create_box/features/cart_page/bloc/cart_state.dart';
import 'package:create_box/features/constructor_page/bloc/constructor_bloc.dart';
import 'package:create_box/features/constructor_page/bloc/constructor_event.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOneStep extends StatelessWidget {
  const MyOneStep({super.key, required this.step});
  final int step;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<ConstructorBloc>(context)
            .add(SelectPageEvent(step: step - 1));
      },
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if ((step == 1 && state.wrapper != null) ||
              (step == 2 && state.comics.isNotEmpty) ||
              (step == 3 && state.sweet.isNotEmpty)) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 24),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color.fromRGBO(222, 180, 113, 1),
                  width: 2,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Icon(EvaIcons.doneAllOutline, 
                color: Theme.of(context).colorScheme.secondary,)],
              ),
            );
          } else {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 24),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color.fromRGBO(222, 180, 113, 1),
                  width: 2,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "$step", style: Theme.of(context).textTheme.titleLarge,
                    //textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
