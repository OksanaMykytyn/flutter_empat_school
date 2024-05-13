import 'package:create_box/features/cart_page/bloc/cart_bloc.dart';
import 'package:create_box/routes/app_navigation.dart';
import 'package:create_box/theme/bloc/theme_bloc.dart';
import 'package:create_box/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    // Log or handle the error details
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartBloc(),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (context, state) {
          return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              themeMode: state,
              darkTheme: darkTheme,
              routerConfig: AppNavigation.router);
        },
      ),
    );
  }
}
