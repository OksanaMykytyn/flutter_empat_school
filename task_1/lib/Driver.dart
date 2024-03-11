import 'package:task_1/Car.dart';

class Driver {
  Driver({
    required String surname,
    required String name,
    required int age,
    List<Car>? cars,
  }):
  _surname = surname, 
  _name = name, 
  _age = age, 
  _cars = cars ?? [];

  String _name;
  String _surname;
  int _age;
  List<Car> _cars;

  String get surname => _surname;
  String get name => _name;
  int get age => _age;
  List<Car> get cars => _cars;

  set addCar(Car car) => _cars.add(car);

  void grewUp () {
    _age++;
  }

  @override
  String toString() {
    if (_cars.isNotEmpty) {
      String carList = _cars.map((car) => car.toString()).join(', ');
      return '$surname $name has cars: $carList';
    } else {
      return '$surname $name does not have a car';
    }
  }

  double totalPrice() {
    double price = 0;
    for (var element in cars) {
      price += element.price;
    }
    return price;
  }
}
