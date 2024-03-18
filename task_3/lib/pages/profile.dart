import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_3/util/bubble_stories.dart';
import 'package:task_3/util/profile_tab1.dart';

import '../util/profile_tab2.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'oksanka.omg',
              style: TextStyle(
                color: Colors.black,
              ),
              ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Icon(Icons.add_box_outlined),
                ),
                Icon(Icons.menu_outlined),
              ],
            )
          ],
          ),
      ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //profile picture
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle
                      ),
                  ),
              
                  //number of post, folowers, folowing
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              '51',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16),), 
                            Text('Posts'),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '678k',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16),), 
                            Text('Folowers'),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '34',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16),), 
                            Text('Folowing'),
                          ],
                        ),
                      ],
                    ),
                  ),
        
              
                ],
              ),
            ),
            //name and bio
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Oksanka',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                            child: Text('I want to talk about me'),
                          ),
                      ],
                    ),
                  ),
      
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Center(child: Text(
                                'Edit profile',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                )),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Center(child: Text(
                                'Share profile',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                )),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
      
                  //stories
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Row(
                      children: [
                        BubbleStories(text: 'story 1'),
                        BubbleStories(text: 'story 2'),
                        BubbleStories(text: 'story 3'),
                      ],
                    ),
                  ),

                  TabBar(tabs: [
                    Tab(icon: Icon(Icons.grid_on_sharp),),
                    Tab(icon: Icon(Icons.account_box_outlined),)
                  ]),
                  Expanded(child: TabBarView(children: [
                    ProfileTab1(),
                    ProfileTab2(),
                  ],)),
         ],
        ),
      ),
    );
  }
}