import 'package:create_box/repository/bestsellers/models/comics.dart';
import 'package:create_box/repository/bestsellers/models/sweet.dart';
import 'package:create_box/repository/bestsellers/models/wrapper.dart';

class Box {
  final int id;
  final String name;
  final String description;
  final double price;
  final String photoPath;
  final Wrapper wrapper;
  final List<Comics> comics;
  final List<Sweet> sweets;

  Box({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.photoPath,
    required this.wrapper,
    required this.comics,
    required this.sweets,
  });

  factory Box.fromJson(Map<String, dynamic> json) {
    return Box(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      photoPath: json['photo_path'],
      wrapper: Wrapper.fromJson(json['wrapper']),
      comics: (json['comics'] as List).map((e) => Comics.fromJson(e)).toList(),
      sweets: (json['sweets'] as List).map((e) => Sweet.fromJson(e)).toList(),
    );
  }
}
