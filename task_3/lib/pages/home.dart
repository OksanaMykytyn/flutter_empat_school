import 'package:flutter/material.dart';
import 'package:task_3/util/bubble_stories.dart';
import 'package:task_3/util/user_posts.dart';

class UserHome extends StatelessWidget {
  final List<String> people = [
    'oksanka', 
    'bjnllnk', 
    '5vb89mj', 
    'vhjfum', 
    'bj78vdk', 
    'dkmdmss', 
    'fdkfmdkmd', 
    'dslds'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Instagram',
              style: TextStyle(
                color: Colors.black,
              ),
              ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Icon(Icons.favorite_outline_rounded),
                ),
                Icon(Icons.messenger_outline_rounded),
              ],
            )
          ],
          ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            //stories
            Container(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: people.length,
                itemBuilder: (context,index) {
                return BubbleStories(text: people[index]);
              }),
              ),
            //posts
            Expanded(
              child: ListView.builder(
                itemCount: people.length,
                itemBuilder: (context, index){
                return UserPosts(name: people[index],
                );
              }),
            ) 
        ],
        ),
        ),
    );
  }
}