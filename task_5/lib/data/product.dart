class Product {
  final String image;
  final String name;
  final String desc;
  final double price;

  Product({
    required this.image,
    required this.name,
    required this.desc,
    required this.price,
  });
}

final List<Product> products = [
    Product(image: 'image/book2.jpg', 
    name: 'Манхва "Щоб допомогти тобі зрозуміти"', 
    desc: "3 томи", price: 1467.00),
    Product(image: 'image/book1.png', 
    name: 'Книга-листівка "Сирена" (моменти Аріадни та Ллойда)', 
    desc: "40 ст.", price: 367.70),
    Product(image: 'image/thing.png', 
    name: 'Брелки Аріадни та Ллойда з манхви "Сирена"', 
    desc: "2 шт.", price: 89.99),
    Product(image: 'image/candy.webp', 
    name: 'Маршмелоу "Beauty"', 
    desc: "Солодощі", price: 90.00),
    Product(image: 'image/candy2.webp', 
    name: 'Дизайнерські цукерки ручної роботи з бельгійського шоколаду з додаванням горіхів', 
    desc: "Солодощі", price: 65.99),
    Product(image: 'image/light1.webp', 
    name: 'Ароматична свічка "Dreamy" watermelon and lemonade', 
    desc: "Аромасвічка", price: 120.50),
    Product(image: 'image/productForGift1.jfif', 
    name: 'Парфуми Аріадни Кортез з манхви "Сирена"', 
    desc: "Фруктовий та квітковий аромат", price: 785.30),
    Product(image: 'image/cart1.webp', 
    name: 'Фотокартки з манхви "Лиходійка-маріонетка"', 
    desc: "10 шт.", price: 785.30),
  ];