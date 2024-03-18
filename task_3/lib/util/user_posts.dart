import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class UserPosts extends StatelessWidget {
  final String name;

  UserPosts({required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //profile photo
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(name, style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ],
              ),
              Icon(Icons.more_vert)
            ],
          ),
        ),
        //post
        Container(
          height: 400,
          color: Colors.grey[300],
        ),


        //below the post
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.favorite_outline_rounded),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(Icons.messenger_outline_rounded),
                  ),
                  Icon(Icons.share_rounded),
                ],
              ),
              Icon(Icons.bookmark_border_outlined),
            ],
          ),
        ),

        //comments
        Padding(
          padding: const EdgeInsets.only(left: 14.0),
          child: Row(
            children: [
              Text('Liked by '),
              Text(
                'oksanka',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
              ),),
              Text(' and other'),
            ],
          ),
        ),


        Padding(
          padding: const EdgeInsets.only(left: 14.0, top: 8.0, right: 14.0),
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
              ),),
              TextSpan(text: ' I try to do it... it is hard, but it very interested. I like to learn Flutter. Thanks gor task'),
            ],),
          ),
        ),


      ],
    );
  }
}