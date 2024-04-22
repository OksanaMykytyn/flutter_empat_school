import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:task_6/models/shop.dart';
import 'package:task_6/pages/create_product.dart';
import 'package:task_6/widgets/my_appbar.dart';
import 'package:task_6/widgets/my_own_produt_list.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  Future<void> _createProuct(
      BuildContext context, bool isImage) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => CreateProduct(
                isImage: isImage,
              )),
    );

    Provider.of<Shop>(context, listen: false).addProductToMyProduct(result);

    if (!context.mounted) return;

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('Додано ваш продукт!',
      style: Theme.of(context).textTheme.bodyLarge,),
      backgroundColor: Theme.of(context).colorScheme.background,
      )
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Додані товари'),
      body: Consumer<Shop>(
          builder: (BuildContext context, Shop value, Widget? child) {
        if (value.myPtoduct.isEmpty) {
          return Center(
            child: Text(
              'Немає доданих товарів',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        } else {
          return MyOwnProductList(myPtoduct: value.myPtoduct);
        }
      }),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        activeIcon: Icons.close,
        backgroundColor: Theme.of(context).primaryColor,
        overlayColor: Colors.black,
        overlayOpacity: 0.4,
        spacing: 12,
        spaceBetweenChildren: 12,
        closeManually: false,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.add_a_photo_outlined),
            backgroundColor: Theme.of(context).colorScheme.background,
            label: 'З фото',
            labelStyle: Theme.of(context).textTheme.bodyLarge,
            onTap: () {
              _createProuct(context, true);
            },
          ),
          SpeedDialChild(
              child: const Icon(Icons.no_photography_outlined),
              backgroundColor: Theme.of(context).colorScheme.background,
              label: 'Без фото',
              labelStyle: Theme.of(context).textTheme.bodyLarge,
              onTap: () {
                _createProuct(context, false);
              }),
        ],
      ),
    );
  }
}
