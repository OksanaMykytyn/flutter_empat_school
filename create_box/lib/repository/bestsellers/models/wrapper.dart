class Wrapper {
  final int id;
  final String name;
  final String description;
  final double price;
  final String photoPath;

  Wrapper({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.photoPath,
  });

  factory Wrapper.fromJson(Map<String, dynamic> json) {
    return Wrapper(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      photoPath: json['photo_path'],
    );
  }
}