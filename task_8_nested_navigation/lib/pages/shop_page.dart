import 'package:flutter/material.dart';
import 'package:task_6/widgets/my_appbar.dart';
import 'package:task_6/widgets/my_category_list.dart';
import 'package:task_6/widgets/my_drawer.dart';
import 'package:task_6/widgets/my_list_view_product.dart';
import 'package:task_6/widgets/my_total_info.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const MyAppBar(title: "Магазинчик"),
      drawer: const MyDrawer(),
      body: const Column(
        children: [
          MyTotalInfo(),
          MyCategoryList(),
          MyListViewProduct(),
        ],
      ),
    );
  }
}
