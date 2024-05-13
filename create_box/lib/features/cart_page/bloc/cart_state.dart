import 'package:create_box/repository/bestsellers/models/comics.dart';
import 'package:create_box/repository/bestsellers/models/sweet.dart';
import 'package:create_box/repository/bestsellers/models/wrapper.dart';

class CartState {
  final List<Comics> comics;
  final Wrapper? wrapper;
  final List<Sweet> sweet;

  double get totalPrice {
    double total = 0.0;

    for (Comics comic in comics) {
      total += comic.price;
    }

    if (wrapper != null) {
      total += wrapper!.price;
    }

    for (Sweet s in sweet) {
      total += s.price;
    }

    return total;
  }

  CartState({this.comics = const [], this.wrapper, this.sweet = const []});

  CartState copyWith({
    List<Comics>? comics,
    List<Sweet>? sweet,
    Wrapper? wrapper,
  }) {
    return CartState(
      comics: comics ?? this.comics,
      sweet: sweet ?? this.sweet,
      wrapper: wrapper ?? this.wrapper,
    );
  }
}
