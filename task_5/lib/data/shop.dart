import 'package:task_5/data/product.dart';

class Shop {

  Shop();

  final List<Product> gift = [];

  double sumAllproducts = 0;

 void addThisProductToGift(Product product) {
  gift.add(product);
  sumAllproducts += product.price;
 }

 void removeThisProductToGift(Product product) {
  gift.remove(product);
  sumAllproducts -= product.price;
 }

  int lengthGift() {
    return gift.length;
  }
}