import 'package:create_box/features/constructor_page/components/my_constructor_wrappers.dart';
import 'package:create_box/repository/bestsellers/models/comics.dart';
import 'package:create_box/repository/bestsellers/models/sweet.dart';
import 'package:create_box/repository/bestsellers/models/wrapper.dart';
import 'package:flutter/material.dart';

class ConstructorState {}

class ConstructorPageOpening extends ConstructorState {}

class ConstructorPageOpenend extends ConstructorState {
  final Widget constructor;

  ConstructorPageOpenend({this.constructor = const MyConstructorWrappers()});
}

//wrappers
class WrappersListInitial extends ConstructorState {}

class WrappersListLoading extends ConstructorState {}

class WrappersListLoaded extends ConstructorState {
  final List<Wrapper> wrappersList;

  WrappersListLoaded({required this.wrappersList});
}

//sweets
class SweetsListInitial extends ConstructorState {}

class SweetsListLoading extends ConstructorState {}

class SweetsListLoaded extends ConstructorState {
  final List<Sweet> sweetsList;

  SweetsListLoaded({required this.sweetsList});
}

//comics
class ComicsListInitial extends ConstructorState {}

class ComicsListLoading extends ConstructorState {}

class ComicsListLoaded extends ConstructorState {
  final List<Comics> comicsList;

  ComicsListLoaded({required this.comicsList});
}
