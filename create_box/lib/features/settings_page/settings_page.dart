import 'package:create_box/components/app_bar/my_app_bar_for_main_page.dart';
import 'package:create_box/theme/bloc/theme_bloc.dart';
import 'package:create_box/theme/bloc/theme_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarForMainPage(title: 'Settings'),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Change dark theme?',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Switch(
                    value: context.read<ThemeBloc>().state == ThemeMode.dark,
                    onChanged: (value) {
                      context
                          .read<ThemeBloc>()
                          .add(ThemeChanged(isDark: value));
                    }),
              ],
            ),
            /* Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Дані від АРІ (In progress...)',
                  style: Theme.of(context).textTheme.titleMedium,),
                  Switch(
                      value: fromAPI,
                      onChanged: (fromAPI) {
                        fromAPI = fromAPI ? false : true;
                      })
                ],
              ),
            ), */
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'INFORMATION ABOUT THE DEVELOPERS',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Text(
                    '     The application was developed by Oksana Mykytyn and Kateryna Hryhorieva. Our goal is to help you create a unique gift for an anime and manga lover',
                    style: Theme.of(context).textTheme.titleMedium,
                    softWrap: true,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
