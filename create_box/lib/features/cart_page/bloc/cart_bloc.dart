import 'package:create_box/features/cart_page/bloc/cart_event.dart';
import 'package:create_box/features/cart_page/bloc/cart_state.dart';
import 'package:create_box/repository/bestsellers/models/comics.dart';
import 'package:create_box/repository/bestsellers/models/sweet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    on<AddToCartComics>((event, emit) {
      final updatedComics = List<Comics>.from(state.comics)..add(event.comics);
      emit(state.copyWith(comics: updatedComics));
    });

    on<RemoveFromCartComics>((event, emit) {
      final updatedComics = List<Comics>.from(state.comics)
        ..remove(event.comics);
      emit(state.copyWith(comics: updatedComics));
    });

    on<AddToCartSweet>((event, emit) {
      final updatedSweets = List<Sweet>.from(state.sweet)..add(event.sweet);
      emit(state.copyWith(sweet: updatedSweets));
    });

    on<RemoveFromCartSweet>((event, emit) {
      final updatedSweets = List<Sweet>.from(state.sweet)..remove(event.sweet);
      emit(state.copyWith(sweet: updatedSweets));
    });

    on<AddToCartWrapper>((event, emit) {
      final newState = state.copyWith(
        wrapper: event.wrapper,
      );
      emit(newState);
    });

    on<RemoveFromCartWrapper>((event, emit) {
      final newState = state.copyWith(wrapper: null);
      emit(newState);
    });
  }
}
