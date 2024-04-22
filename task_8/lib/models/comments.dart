import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Comment {
  int postId;
  int id;
  String name;
  String email;
  String body;

  Comment(
      {required this.postId,
      required this.id,
      required this.name,
      required this.email,
      required this.body});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'postId': int postId,
        'id': int id,
        'name': String name,
        'email': String email,
        'body': String body,
      } =>
        Comment(postId: postId, id: id, name: name, email: email, body: body),
      _ => throw const FormatException('Помилка завантаження коментарів'),
    };
  }
}

List<Comment> parseComments(String responseBody) {
  final parsed =
      (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

  return parsed.map<Comment>((json) => Comment.fromJson(json)).toList();
}

Future<List<Comment>> fetchComments() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1/comments'));
  return compute(parseComments, response.body);
}
