import 'package:create_box/repository/bestsellers/models/box.dart';

class BestsellersListState {}

class BestsellersListInitial extends BestsellersListState {}

class BestsellersListLoading extends BestsellersListState {}

class BestsellersListLoaded extends BestsellersListState {
  final List<Box> bestsellersList;

  BestsellersListLoaded({required this.bestsellersList});
}
