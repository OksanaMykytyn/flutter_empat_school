import 'package:create_box/components/app_bar/my_app_bar_for_main_page.dart';
import 'package:create_box/features/constructor_page/components/my_steps.dart';
import 'package:create_box/components/for_content_of_page/title_for_page.dart';
import 'package:create_box/features/constructor_page/bloc/constructor_bloc.dart';
import 'package:create_box/features/constructor_page/bloc/constructor_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConstructorPage extends StatelessWidget {
  const ConstructorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ConstructorBloc>(
      create: (context) => ConstructorBloc(),
      child: Scaffold(
        appBar: const MyAppBarForMainPage(title: 'Constructor'),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFD0D5FF), Color(0xFFFFF2DD)],
              stops: [
                0.1151,
                0.9886
              ], // Positions of the colors within the gradient
              begin: Alignment.topCenter, // Starting point of the gradient
              end: Alignment.bottomCenter, // Ending point of the gradient
            ),
          ),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: MySteps(),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: Theme.of(context).colorScheme.background,
                  child: const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: TitleForPage(title: 'STEPS'),
                  ),
                ),
              ),
              BlocBuilder<ConstructorBloc, ConstructorState>(
                //bloc: ConstructorBloc()..add(SelectStep(step: 0)),
                builder: (context, state) {
                  if (state is ConstructorPageOpening) {
                    return const SliverToBoxAdapter(
                        child: Padding(
                      padding: EdgeInsets.only(top: 50.0),
                      child: CircularProgressIndicator(),
                    ));
                  } else if (state is ConstructorPageOpenend) {
                    return state.constructor;
                  } else {
                    return const SliverToBoxAdapter(child: Text('Eror'));
                  }
                },
              )
              //MyConstructorComics()
            ],
          ),
        ),
      ),
    );
  }
}
