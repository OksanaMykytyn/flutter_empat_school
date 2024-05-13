import 'package:create_box/features/constructor_page/components/my_one_step.dart';
import 'package:flutter/material.dart';

class MySteps extends StatelessWidget {
  const MySteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color.fromRGBO(255, 242, 221, 1), // Або бажаний колір
                  width: 4.0,
                ),
              ),
            ),
            width: double.infinity, // Розширити на всю ширину
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyOneStep(step: 1),
              MyOneStep(step: 2),
              MyOneStep(step: 3),
              MyOneStep(step: 4),
            ],
          ),
        ],
      ),
    );
  }
}
