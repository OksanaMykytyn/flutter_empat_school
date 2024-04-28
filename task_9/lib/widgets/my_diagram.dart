import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_6/models/shop.dart';

class MyDiagram extends StatefulWidget {
  const MyDiagram({super.key});

  @override
  State<MyDiagram> createState() => _MyDiagramState();
}

class _MyDiagramState extends State<MyDiagram>
    with TickerProviderStateMixin {
          final List<String> years = ['Усі', '2021', '2022', '2023', '2024'];

  late Animation<double> animation;
  late Animation<double> animation2;
  late Animation<double> animation3;
  late Animation<double> animation4;
  late Animation<Color?> animationColor;

  late AnimationController controller;
  late AnimationController controllerColor;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    controllerColor =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = Tween<double>(begin: 0, end: 80).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    animation2 = Tween<double>(begin: 0, end: 200).animate(controller);
    animation3 = Tween<double>(begin: 0, end: 130).animate(controller);
    animation4 = Tween<double>(begin: 0, end: 260).animate(controller);

    controller.forward();

    animationColor = ColorTween(
      begin: Colors.green, 
      end: Colors.grey).animate(controllerColor)
        ..addListener(() { 
      setState(() {

      }); 
    });

    controllerColor.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 300,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('100k', style: Theme.of(context).textTheme.headlineMedium),
              Text('80k', style: Theme.of(context).textTheme.headlineMedium),
              Text('60k', style: Theme.of(context).textTheme.headlineMedium),
              Text('40k', style: Theme.of(context).textTheme.headlineMedium),
              Text('20k', style: Theme.of(context).textTheme.headlineMedium),
              Text('0', style: Theme.of(context).textTheme.headlineMedium),
            ],
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Consumer<Shop>(
                builder: (context, value, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 30,
                        height: animation.value,
                        color: value.statistic == 0 || value.statistic == 1
                            ? animationColor.value
                            : Colors.grey,
                      ),
                      Container(
                        width: 30,
                        height: animation2.value,
                        color: value.statistic == 0 || value.statistic == 2
                            ? Colors.amber
                            : Colors.grey,
                      ),
                      Container(
                        width: 30,
                        height: animation3.value,
                        color: value.statistic == 0 || value.statistic == 3
                            ? Colors.pink
                            : Colors.grey,
                      ),
                      Container(
                        width: 30,
                        height: animation4.value,
                        color: value.statistic == 0 || value.statistic == 4
                            ? Colors.blueAccent
                            : Colors.grey,
                      ),
                    ],
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('2021',
                        style: Theme.of(context).textTheme.headlineMedium),
                    Text('2022',
                        style: Theme.of(context).textTheme.headlineMedium),
                    Text('2023',
                        style: Theme.of(context).textTheme.headlineMedium),
                    Text('2024',
                        style: Theme.of(context).textTheme.headlineMedium),
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }
}
