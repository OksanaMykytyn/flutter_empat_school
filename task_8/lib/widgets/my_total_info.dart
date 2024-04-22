import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_6/models/shop.dart';

class MyTotalInfo extends StatelessWidget {
  const MyTotalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Consumer<Shop>(
              builder: (BuildContext context, Shop value, Widget? child) {
                if (value.discount == 0) {
                  return Text(
                    'Кількість предметів: ${value.gift.length}\nCума: ${value.sumAllproducts.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.labelMedium,
                  );
                } else {
                  return Text(
                    'Кількість предметів: ${value.gift.length}\nCума: ${value.sumAllproducts.toStringAsFixed(2)}\nЗникжка - ${value.discount} % на усі товари',
                    style: Theme.of(context).textTheme.labelMedium,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
