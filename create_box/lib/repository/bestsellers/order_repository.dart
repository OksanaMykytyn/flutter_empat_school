import 'dart:convert';
import 'package:create_box/repository/bestsellers/models/box.dart';
import 'package:http/http.dart' as http;

class OrderRepository {
  Future<void> createOrder(
      {required int id,
      required String fullName,
      required String email,
      required String phone,
      required String address,
      required String payment}) async {
    var url = Uri.parse('https://my-gift.test/api/users/order');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    Map<String, dynamic> orderData = {
      'box_id': id,
      'full_name': fullName,
      'email': email,
      'phone': phone,
      'address': address,
      'payment': payment,
    };

    try {
      var response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(orderData),
      );

      if (response.statusCode == 201) {
        print('Order created successfully');
      } else {
        print('Failed to create order. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error creating order: $e');
    }
  }

  Future<int?> createBox(Box box) async {
    var url = Uri.parse(
        'https://my-gift.test/api/users/box'); // Replace with your API endpoint

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    var boxData = {
      'name': box.name,
      'description': box.description,
      'price': box.price,
      'photo_path': box.photoPath,
      'wrapper_id': box.wrapper.id,
      'comics': box.comics.map((comic) => comic.id).toList(),
      'sweets': box.sweets.map((sweet) => sweet.id).toList(),
    };

    var response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(boxData),
    );

    if (response.statusCode == 201) {
      // Parse the response body to extract the box ID
      var responseData = jsonDecode(response.body);
      if (responseData != null && responseData['id'] != null) {
        return responseData['id'];
      } else {
        print('Failed to retrieve box ID from response');
        return null;
      }
    } else {
      print('Failed to create box. Error: ${response.body}');
      return null;
    }
  }
}
