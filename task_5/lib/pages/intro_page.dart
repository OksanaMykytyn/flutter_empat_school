import 'package:flutter/material.dart';
import 'package:task_5/colors.dart';
import 'package:task_5/components/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mywhitepink,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(Icons.shopping_bag_rounded,
            size: 80,
            color: myblue,),
            const SizedBox(height: 25),
            //title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                "Створи подарунок для любителя манхви",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                ),
                textAlign: TextAlign.center,
                ),
            ),
            const SizedBox(height: 10),
            //subtitle
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                'Подаруй приємні враження близькій людині, яка захоплюється читанням корейських коміксів',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                ),
                ),
            ),
            const SizedBox(height: 25),
            //button
            MyButton(
              onTap: () => Navigator.pushNamed(context, '/shop_page'), 
              child: const Icon(Icons.arrow_forward))
          ],
        ),
      ),
    );
  }
}