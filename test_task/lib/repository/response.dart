import 'package:test_task/repository/task.dart';

class ApiResponse {
  final bool error;
  final String message;
  final List<Task> data;

  ApiResponse({required this.error, required this.message, required this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      error: json['error'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => Task.fromJson(item))
          .toList(),
    );
  }
}
