import 'package:flutter/material.dart';
import 'package:task_3/util/explore_grid.dart';

class UserSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: EdgeInsets.all(8),
            color: Colors.grey[200],
            child: Row(
              children: [
                Icon(Icons.search_rounded, color: Colors.grey[700],),
                Container(
                  child:Text(
                    'Search',
                    style: TextStyle(color: Colors.grey[500]),
                    ),
                ),
            ],
            ),
          ),
        ),
      ),
      body: ExploreGrid(),
    );
  }
}