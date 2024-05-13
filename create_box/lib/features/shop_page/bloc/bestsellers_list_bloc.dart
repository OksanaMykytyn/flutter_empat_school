import 'package:create_box/features/shop_page/bloc/bestsellers_list_event.dart';
import 'package:create_box/features/shop_page/bloc/bestsellers_list_state.dart';
import 'package:create_box/repository/bestsellers/bestsellers_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestsellersListBloc
    extends Bloc<BestsellersListEvent, BestsellersListState> {
  BestsellersListBloc() : super(BestsellersListInitial()) {
    on<LoadBestsellersList>((event, emit) async {
      emit(BestsellersListLoading());
      final bestsellersList =
          await BestsellersRepository().getBestsellersList();
      emit(BestsellersListLoaded(bestsellersList: bestsellersList));
    });
  }
}
