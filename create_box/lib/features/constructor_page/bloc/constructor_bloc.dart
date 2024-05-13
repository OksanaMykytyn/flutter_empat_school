import 'package:create_box/features/constructor_page/components/my_constructor_wrappers.dart';
import 'package:create_box/features/constructor_page/components/my_constructor_comics.dart';
import 'package:create_box/features/constructor_page/components/my_constructor_order.dart';
import 'package:create_box/features/constructor_page/components/my_constructor_sweets.dart';
import 'package:create_box/features/constructor_page/bloc/constructor_event.dart';
import 'package:create_box/features/constructor_page/bloc/constructor_state.dart';
import 'package:create_box/repository/bestsellers/comics_repository.dart';
import 'package:create_box/repository/bestsellers/sweets_repository.dart';
import 'package:create_box/repository/bestsellers/wrappers_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConstructorBloc extends Bloc<ConstructorEvent, ConstructorState> {
  ConstructorBloc() : super(ConstructorPageOpenend()) {
    on<SelectPageEvent>((event, emit) {
      emit(ConstructorPageOpening());
      final selectedStep = event.step; // Get selected step from event
      Widget constructor;
      switch (selectedStep) {
        case 0:
          constructor = const MyConstructorWrappers();
          break;
        case 1:
          constructor = const MyConstructorComics();
          break;
        case 2:
          constructor = const MyConstructorSweets();
          break;
        case 3:
          constructor = const MyConstructorOrder();
          break;
        default:
          constructor = const MyConstructorWrappers();
          break; // Default constructor
      }
      emit(ConstructorPageOpenend(constructor: constructor));
    });

    on<LoadWrappersList>((event, emit) async {
      emit(WrappersListLoading());
      final wrappersList = await WrappersRepository().getWrappersList();
      emit(WrappersListLoaded(wrappersList: wrappersList));
    });

    on<LoadSweetsList>((event, emit) async {
      emit(SweetsListLoading());
      final sweetsList = await SweetsRepository().getSweetsList();
      emit(SweetsListLoaded(sweetsList: sweetsList));
    });

    on<LoadComicsList>((event, emit) async {
      emit(ComicsListLoading());
      final comicsList = await ComicsRepository().getComicsList();
      emit(ComicsListLoaded(comicsList: comicsList));
    });
  }
}
