import 'package:create_box/repository/bestsellers/models/comics.dart';
import 'package:create_box/repository/bestsellers/models/sweet.dart';
import 'package:create_box/repository/bestsellers/models/wrapper.dart';

class CartEvent {}

class AddToCartComics extends CartEvent {
  final Comics comics;

  AddToCartComics({required this.comics});
}

class RemoveFromCartComics extends CartEvent {
  final Comics comics;

  RemoveFromCartComics({required this.comics});
}

class AddToCartSweet extends CartEvent {
  final Sweet sweet;

  AddToCartSweet({required this.sweet});
}

class RemoveFromCartSweet extends CartEvent {
  final Sweet sweet;

  RemoveFromCartSweet({required this.sweet});
}

class AddToCartWrapper extends CartEvent {
  final Wrapper wrapper;

  AddToCartWrapper({required this.wrapper});
}

class RemoveFromCartWrapper extends CartEvent {
  final Wrapper wrapper;

  RemoveFromCartWrapper({required this.wrapper});
}
