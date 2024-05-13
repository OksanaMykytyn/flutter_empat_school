import 'package:create_box/repository/bestsellers/models/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WrappersRepository {
  Future<List<Wrapper>> getWrappersList() async {
    final response =
        await http.get(Uri.parse('https://my-gift.test/api/users/wrappers'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['data'];

      List<Wrapper> wrappers = data.map((item) {
        return Wrapper(
          id: item['id'],
          name: item['name'],
          description: item['description'],
          price: item['price'].toDouble(),
          photoPath: item['photo_path'],
        );
      }).toList();

      debugPrint(wrappers.toString());
      return wrappers;
    } else {
      throw Exception('Failed to load bestsellers list');
    }
  }
}
