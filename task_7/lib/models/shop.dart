import 'package:flutter/material.dart';
import 'package:task_6/models/lists/class_product.dart';

class Shop extends ChangeNotifier {
  Shop();
  final List<Product> gift = [];
  double sumAllproducts = 0;
  int discount = 0;

  void addThisProductToGift(Product product) {
    gift.add(product);
    sumAllproducts += (product.price - product.price * discount / 100);
    notifyListeners();
  }

  void removeThisProductToGift(Product product) {
    gift.remove(product);
    sumAllproducts -= (product.price - product.price * discount / 100);
    notifyListeners();
  }

  int selectedCategory = 0;
  void changeCategory(int index) {
    selectedCategory = index;
    notifyListeners();
  }

  void getDiscount(int discount) {
    this.discount = discount;
    sumAllproducts *= (100 - discount) / 100;
    notifyListeners();
  }
}
