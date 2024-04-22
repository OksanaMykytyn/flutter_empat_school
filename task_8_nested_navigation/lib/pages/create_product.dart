import 'package:flutter/material.dart';
import 'package:task_6/models/lists/class_product.dart';
import 'package:task_6/widgets/my_appbar.dart';
import 'package:task_6/widgets/my_button.dart';

class CreateProduct extends StatelessWidget {
  const CreateProduct({super.key, required this.isImage});
  final bool isImage;

  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();
    late String name;
    late String desc;
    late double price;
    late String image;

    @override
    void dispose() {
      myController.dispose();
    }

    return Scaffold(
      appBar: const MyAppBar(title: "Створити продукт"),
      body: Column(
        children: [
          if(isImage)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: TextFormField(
              onChanged: (text) {
                image = myController.text;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Введи шлях до продукту',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: TextFormField(
              onChanged: (text) {
                name = text;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Введи назву продукту',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: TextFormField(
              onChanged: (text) {
                desc = text;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Введи опис продукту',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: TextFormField(
              onChanged: (text) {
                price = double.parse(text);
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Введи ціну продукту',
              ),
            ),
          ),
          MyButton(
            onTap: () {
              if (isImage) {
                Navigator.pop(
                    context,
                    Product(
                        image: image,
                        name: name,
                        desc: desc,
                        price: price,
                        categoty: 'Мій товар'));
              } else {
                Navigator.pop(
                    context,
                    Product(
                        image: 'noImage',
                        name: name,
                        desc: desc,
                        price: price,
                        categoty: 'Мій товар'));
              }
            },
            color: Theme.of(context).colorScheme.primary,
            child: Text(
              'Активувати!',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ],
      ),
    );
  }
}
