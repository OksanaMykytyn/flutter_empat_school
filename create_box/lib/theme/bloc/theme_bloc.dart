import 'package:create_box/theme/bloc/theme_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeMode> {
  ThemeBloc() : super(ThemeMode.light) {
    on<ThemeChanged>((event, emit) {
      emit(event.isDark ? ThemeMode.dark : ThemeMode.light);
    });
  }
}
