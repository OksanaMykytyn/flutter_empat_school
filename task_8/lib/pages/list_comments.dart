import 'package:flutter/material.dart';
import 'package:task_6/models/comments.dart';
import 'package:task_6/widgets/my_appbar.dart';
import 'package:task_6/widgets/my_comments_view.dart';

class ListComments extends StatelessWidget {
  const ListComments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "Відгуки"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<List<Comment>>(
            future: fetchComments(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Помилка'),
                );
              } else if (snapshot.hasData) {
                return MyCommentsView(comments: snapshot.data!);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
