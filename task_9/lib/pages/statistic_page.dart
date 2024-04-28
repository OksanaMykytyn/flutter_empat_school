import 'package:flutter/material.dart';
import 'package:task_6/widgets/my_action.dart';
import 'package:task_6/widgets/my_appbar.dart';
import 'package:task_6/widgets/my_tile_year.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({super.key});

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage>
    with TickerProviderStateMixin {
  final List<String> years = ['Усі', '2021', '2022', '2023', '2024'];

  late Animation<double> animation;
  late Animation<double> animation2;
  late Animation<double> animation3;
  late Animation<double> animation4;
  late Animation<Color?> animationColor;
  late Animation<Color?> animationColor2;
  late Animation<Color?> animationColor3;
  late Animation<Color?> animationColor4;

  late AnimationController controller;
  late AnimationController controllerColor;
  late AnimationController controllerColor2;
  late AnimationController controllerColor3;
  late AnimationController controllerColor4;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    controllerColor = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    controllerColor2 = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    controllerColor3 = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    controllerColor4 = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);

    animation = Tween<double>(begin: 0, end: 80).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    animation2 = Tween<double>(begin: 0, end: 200).animate(controller);
    animation3 = Tween<double>(begin: 0, end: 130).animate(controller);
    animation4 = Tween<double>(begin: 0, end: 260).animate(controller);

    controller.forward();

    animationColor = ColorTween(begin: Colors.grey, end: Colors.green)
        .animate(controllerColor)
      ..addListener(() {
        setState(() {});
      });

    animationColor2 = ColorTween(begin: Colors.grey, end: Colors.amber)
        .animate(controllerColor2)
      ..addListener(() {
        setState(() {});
      });

    animationColor3 = ColorTween(begin: Colors.grey, end: Colors.pink)
        .animate(controllerColor3)
      ..addListener(() {
        setState(() {});
      });

    animationColor4 = ColorTween(begin: Colors.grey, end: Colors.blue)
        .animate(controllerColor4)
      ..addListener(() {
        setState(() {});
      });

    controllerColor.forward();
    controllerColor2.forward();
    controllerColor3.forward();
    controllerColor4.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Статистика продажів'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 28,
              child: ListView.builder(
                  itemCount: years.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return MyTileYear(
                      title: years[index],
                      onTap: () {
                        switch (index) {
                          case 0:
                            controllerColor.forward();
                            controllerColor2.forward();
                            controllerColor3.forward();
                            controllerColor4.forward();
                            break;
                          case 1:
                            controllerColor.forward();
                            controllerColor2.reverse();
                            controllerColor3.reverse();
                            controllerColor4.reverse();
                            break;
                          case 2:
                            controllerColor.reverse();
                            controllerColor2.forward();
                            controllerColor3.reverse();
                            controllerColor4.reverse();
                            break;
                          case 3:
                            controllerColor.reverse();
                            controllerColor2.reverse();
                            controllerColor3.forward();
                            controllerColor4.reverse();
                            break;
                          case 4:
                            controllerColor.reverse();
                            controllerColor2.reverse();
                            controllerColor3.reverse();
                            controllerColor4.forward();
                            break;
                          default:
                        }
                      },
                    );
                  }),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            height: 300,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('100k',
                        style: Theme.of(context).textTheme.headlineMedium),
                    Text('80k',
                        style: Theme.of(context).textTheme.headlineMedium),
                    Text('60k',
                        style: Theme.of(context).textTheme.headlineMedium),
                    Text('40k',
                        style: Theme.of(context).textTheme.headlineMedium),
                    Text('20k',
                        style: Theme.of(context).textTheme.headlineMedium),
                    Text('0',
                        style: Theme.of(context).textTheme.headlineMedium),
                  ],
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 30,
                          height: animation.value,
                          color: animationColor.value,
                        ),
                        Container(
                          width: 30,
                          height: animation2.value,
                          color: animationColor2.value,
                        ),
                        Container(
                          width: 30,
                          height: animation3.value,
                          color: animationColor3.value,
                        ),
                        Container(
                          width: 30,
                          height: animation4.value,
                          color: animationColor4.value,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('2021',
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                          Text('2022',
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                          Text('2023',
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                          Text('2024',
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                        ],
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
          const MyAction()
        ],
      ),
    );
  }

  @override
  dispose() {
    controller.dispose();
    controllerColor.dispose();
    controllerColor2.dispose();
    controllerColor3.dispose();
    controllerColor4.dispose();

    super.dispose();
  }
}
