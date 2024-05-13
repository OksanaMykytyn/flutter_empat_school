import 'package:create_box/repository/bestsellers/models/comics.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ComicsRepository {
  Future<List<Comics>> getComicsList() async {
    final response =
        await http.get(Uri.parse('https://my-gift.test/api/users/comics'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['data'];

      List<Comics> comics = data.map((item) {
        return Comics(
          id: item['id'],
          name: item['name'],
          description: item['description'],
          price: item['price'].toDouble(),
          photoPath: item['photo_path'],
        );
      }).toList();

      debugPrint(comics.toString());
      return comics;
    } else {
      throw Exception('Failed to load bestsellers list');
    }
  }
}
