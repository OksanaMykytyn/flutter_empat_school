import 'package:flutter/material.dart';

class MyAction extends StatefulWidget {
  const MyAction({super.key});

  @override
  State<MyAction> createState() => _MyActionState();
}

class _MyActionState extends State<MyAction> with SingleTickerProviderStateMixin {

late AnimationController shopController;
  late Animation shopAnimation;
  double size = 40;

  void initState() {
     super.initState();
 
     shopController = AnimationController(
       duration: const Duration(seconds: 1),
       vsync: this,
       lowerBound: 0.8,
     );
 
     shopAnimation = CurvedAnimation(
       parent: shopController,
       curve: Curves.ease,
     );
 
     shopController.forward();
     shopController.addStatusListener((status) {
       setState(() {
         if (status == AnimationStatus.completed) {
           shopController.reverse();
         } else if (status == AnimationStatus.dismissed) {
           shopController.forward();
         }
       });
     });
 
     shopController.addListener(() {
       setState(() {
         size = shopController.value * 40;
       });
     });
   }
 
   @override
   void dispose() {
     shopController.dispose();
     super.dispose();
   }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 70),
      child: Column(
        children: [
          Text(
          'Створи свій боксик з нами!',
          style: Theme.of(context).textTheme.headlineLarge,),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Icon(Icons.shopping_cart,
            size: size,
            color: Theme.of(context).colorScheme.primary,
            ),
          )
          ],
      ),
    );
  }
}
