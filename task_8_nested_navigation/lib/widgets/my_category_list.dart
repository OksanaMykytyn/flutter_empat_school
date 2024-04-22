import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_6/models/lists/lists.dart';
import 'package:task_6/models/shop.dart';

class MyCategoryList extends StatelessWidget {
  const MyCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: Container(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: lists.length,
                itemBuilder: (context, index) {
                 return GestureDetector(
                  onTap: () {
                    Provider.of<Shop>(context, listen: false).changeCategory(index);
                  },
                   child: Container(
                     margin: const EdgeInsets.only(left: 6, right: 6, top: 10),
                     decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                       color: Theme.of(context).colorScheme.primary,
                       boxShadow: [
                         BoxShadow(
                           color: Colors.grey.withOpacity(0.5),
                           spreadRadius: 1,
                           blurRadius: 3,
                         ),
                       ],
                     ),
                     child: Row(
                       children: [
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: ClipRRect(
                             borderRadius: BorderRadius.circular(8),
                             child: Image.asset(
                               lists[index].first.image,
                            ),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(left: 4, right: 16),
                           child: Text(
                             lists[index].first.categoty,
                             style: Theme.of(context).textTheme.labelLarge,
                           ),
                         ),
                       ],
                     ),
                   ),
                 );
                }
              ),
            ),
          );
  }
}