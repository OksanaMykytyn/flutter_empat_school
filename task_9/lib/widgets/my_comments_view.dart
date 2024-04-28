import 'package:flutter/material.dart';
import 'package:task_6/models/comments.dart';
import 'package:task_6/widgets/my_comment.dart';

class MyCommentsView extends StatelessWidget {
  const MyCommentsView({super.key, required this.comments});
  final List<Comment> comments;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: comments.length,
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index) {
            return MyComment(
              body: comments[index].body,
              name: comments[index].name,
            );
          }),
    );
  }
}
