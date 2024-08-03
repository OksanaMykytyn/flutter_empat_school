import 'package:dio/dio.dart';
import 'package:test_task/repository/response.dart';

class ApiService {
  final Dio _dio = Dio();
  final String url;
  ApiService({required this.url});

  Future<ApiResponse> fetchData() async {
    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        return ApiResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Try another URL');
    }
  }
}
