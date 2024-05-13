import 'package:create_box/components/app_bar/my_app_bar_for_main_page.dart';
import 'package:create_box/components/for_content_of_page/title_for_page.dart';
import 'package:create_box/features/shop_page/components/my_banner.dart';
import 'package:create_box/components/for_content_of_page/cards/my_card_bestseller.dart';
import 'package:create_box/features/shop_page/bloc/bestsellers_list_bloc.dart';
import 'package:create_box/features/shop_page/bloc/bestsellers_list_event.dart';
import 'package:create_box/features/shop_page/bloc/bestsellers_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.9;
    final double itemWidth = size.width / 4;
    return Scaffold(
      appBar: const MyAppBarForMainPage(title: 'Shop'),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: MyBanner()),
          const SliverToBoxAdapter(
            child: TitleForPage(
              title: 'OUR BEST SELLERS',
            ),
          ),
          BlocProvider(
            create: (context) =>
                BestsellersListBloc()..add(LoadBestsellersList()),
            child: BlocBuilder<BestsellersListBloc, BestsellersListState>(
              builder: (context, state) {
                if (state is BestsellersListLoaded) {
                  final bestsellersList = state.bestsellersList;
                  return SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final bestseller = bestsellersList[index];
                        return MyCardBestseller(
                          box: bestseller,
                        );
                      },
                      childCount: bestsellersList.length,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: (itemWidth / itemHeight),
                      crossAxisCount: 2,
                    ),
                  );
                } else if (state is BestsellersListLoading) {
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
            ),
          )
        ],
      ),
    );
  }
}
