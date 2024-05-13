import 'package:create_box/repository/bestsellers/models/sweet.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SweetsRepository {
  Future<List<Sweet>> getSweetsList() async {
    final response =
        await http.get(Uri.parse('https://my-gift.test/api/users/sweets'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['data'];

      List<Sweet> sweets = data.map((item) {
        return Sweet(
          id: item['id'],
          name: item['name'],
          description: item['description'],
          price: item['price'].toDouble(),
          photoPath: item['photo_path'],
        );
      }).toList();

      debugPrint(sweets.toString());
      return sweets;
    } else {
      throw Exception('Failed to load bestsellers list');
    }
  }
}
