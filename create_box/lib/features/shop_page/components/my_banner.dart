import 'package:create_box/components/for_content_of_page/buttons/my_yellow_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyBanner extends StatelessWidget {
  const MyBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFD0D5FF), // #D0D5FF
            Color(0xFFFFF2DD), // #FFF2DD
          ],
          stops: [0.1203, 0.7025], // Gradient stops
          begin: Alignment.topLeft, // Gradient start point
          end: Alignment.bottomRight, // Gradient end point
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.2), // Box shadow color
            offset: const Offset(0, 0), // Box shadow offset
            blurRadius: 20, // Box shadow blur radius
            spreadRadius: 6, // Box shadow spread radius
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Simple gift-giving with unforgettable emotions',
                style: Theme.of(context).textTheme.headlineLarge,
                softWrap: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 6.0, top: 24.0),
                child: MyYellowButton(title: 'BUILD A BOX', function: () { 
                  context.goNamed('Constructor');
                 },),)
              ],
            ),
          ),
          const Expanded(
            flex: 3,
            child: Image(
              height: 120,
              width: 120,
              image: AssetImage('images/banner.jpg',),
            ),
          ),
        ],
      ),
    );
  }
}
