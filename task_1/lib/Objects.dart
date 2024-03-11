import 'package:task_1/Car.dart';
import 'package:task_1/CarNumber.dart';
import 'package:task_1/Driver.dart';


  CarNumber carNumber1 = CarNumber(region: 'AA', number: 1234, series: 'BB');
  CarNumber carNumber2 = CarNumber(region: 'AB', number: 5678, series: 'BC');
  CarNumber carNumber3 = CarNumber(region: 'BC', number: 9012, series: 'CD');
  CarNumber carNumber4 = CarNumber(region: 'СМ', number: 3456, series: 'DE');
  CarNumber carNumber5 = CarNumber(region: 'KH', number: 7890, series: 'EF');

  Car car1 = Car(brand: 'Toyota', model: 'Camry', yearOfManufacture: 2018, price: 25000.0, carNumber: carNumber1);
  Car car2 = Car(brand: 'Honda', model: 'Civic', yearOfManufacture: 2019, price: 22000.0, carNumber: carNumber2);
  Car car3 = Car(brand: 'Ford', model: 'Focus', yearOfManufacture: 2020, price: 20000.0, carNumber: carNumber3);

  Driver driver1 = Driver(surname: 'Mykytyn', name: 'Oksana', age: 19, cars: [car1]);

  var cars = [car1, car2, car3];
