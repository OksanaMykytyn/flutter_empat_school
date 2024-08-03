import 'package:test_task/repository/point.dart';

class Task {
  final String id;
  final List<String> field;
  final Point start;
  final Point end;

  Task(
      {required this.id,
      required this.field,
      required this.start,
      required this.end});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      field: List<String>.from(json['field']),
      start: Point.fromJson(json['start']),
      end: Point.fromJson(json['end']),
    );
  }
}
