import 'package:create_box/repository/bestsellers/models/box.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BestsellersRepository {
  Future<List<Box>> getBestsellersList() async {
    final response =
        await http.get(Uri.parse('https://my-gift.test/api/users/boxes'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['data'];
      List<Box> products = data.map((e) => Box.fromJson(e)).toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
