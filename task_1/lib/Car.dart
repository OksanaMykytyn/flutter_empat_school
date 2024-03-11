import 'CarNumber.dart';

class Car {
  Car({
    required String brand,
    required String model,
    required int yearOfManufacture,
    required double price,
    required CarNumber carNumber,
  }): 
  _brand = brand, 
  _model = model, 
  _yearOfManufacture = yearOfManufacture, 
  _price = price, 
  _carNumber = carNumber;
  
  final String _brand;
  final String _model;
  final int _yearOfManufacture;
  double _price;
  CarNumber _carNumber;

  String get brand => _brand;
  String get model => _model;
  int get yearOfManufacture => _yearOfManufacture;
  double get price => _price;
  CarNumber get carNumber => _carNumber;


  set price(double value) => _price = value;
  set carNumber(CarNumber carNumber) => _carNumber = carNumber;

  @override
  String toString() {
    return '$brand $model $yearOfManufacture year of manufacture with number $carNumber';
  }
 
}