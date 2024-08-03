import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Result list screen',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: ListView.separated(
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return const ListTile(
              title: Text(
                '(0;0)->(1;0)',
                textAlign: TextAlign.center,
              ),
              titleAlignment: ListTileTitleAlignment.center,
            );
          },
        ));
  }
}
