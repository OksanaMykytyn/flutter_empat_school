import 'package:flutter/material.dart';
import 'package:task_6/theme.dart';
import 'package:task_6/widgets/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(Icons.shopping_bag_rounded,
            size: 80,
            color: Theme.of(context).colorScheme.primary,),
            const SizedBox(height: 25),
            //title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                "Створи подарунок для любителя манхви",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
                ),
            ),
            const SizedBox(height: 10),
            //subtitle
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                'Подаруй приємні враження близькій людині, яка захоплюється читанням корейських коміксів',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
                ),
            ),
            const SizedBox(height: 25),
            //button
            MyButton(
              onTap: () => Navigator.pushNamed(context, '/home_page'), 
              color: myPink,
              child: const Icon(Icons.arrow_forward))
          ],
        ),
      ),
    );
  }
}