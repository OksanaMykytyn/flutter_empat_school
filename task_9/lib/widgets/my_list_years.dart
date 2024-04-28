import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_6/models/shop.dart';
import 'package:task_6/widgets/my_tile_year.dart';
class MyListYears extends StatelessWidget {
  const MyListYears({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> years = ['Усі', '2021', '2022', '2023', '2024'];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 28,
        child: ListView.builder(
            itemCount: years.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return MyTileYear(
                title: years[index],
                onTap: () {
                  Provider.of<Shop>(context, listen: false).changeStatistic(index);
                  for(int i = 0; i < years.length; i++) {
                    
                  }
                },
              );
            }),
      ),
    );
  }
}
