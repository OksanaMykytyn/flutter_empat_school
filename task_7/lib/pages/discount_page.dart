import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_6/models/shop.dart';
import 'package:task_6/widgets/my_appbar.dart';
import 'package:task_6/widgets/my_button.dart';

class DiscountPage extends StatelessWidget {
  const DiscountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();

    @override
    void dispose() {
      myController.dispose();
    }

    return Scaffold(
      appBar: const MyAppBar(title: "Отримати знижку"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: TextFormField(
              controller: myController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Введи свій промокод',
              ),
            ),
          ),
          MyButton(
            onTap: () {
              String message;
              if (myController.text == "ruby1774") {
                message = "Знижка 15% активована!";
                Provider.of<Shop>(context, listen: false).getDiscount(15);
              } else {
                message = "Знижка за цим промокодом не знайдена";
              }
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Повідомлення"),
                    content: Text(
                      message,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Гаразд"),
                      ),
                    ],
                  );
                },
              );
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
