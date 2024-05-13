class Comics {
  final int id;
  final String name;
  final String description;
  final double price;
  final String photoPath;

  Comics({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.photoPath,
  });

  factory Comics.fromJson(Map<String, dynamic> json) {
    return Comics(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      photoPath: json['photo_path'],
    );
  }
}