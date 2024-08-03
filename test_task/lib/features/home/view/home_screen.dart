import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/features/home/bloc/check_url_bloc.dart';
import 'package:test_task/features/home/bloc/check_url_state.dart';
import 'package:test_task/features/home/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final sizeTextField = MediaQuery.of(context).size.width - 70;
    final TextEditingController urlController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Home Screen',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: BlocBuilder<CheckUrlBloc, CheckUrlState>(
        builder: (context, state) {
          if (state is UrlValidState) {
            return const Expanded(child: LoadingData());
          } else {
            return Column(
              children: [
                Expanded(
                  child: PartForInputRequest(
                    sizeTextField: sizeTextField,
                    urlController: urlController,
                  ),
                ),
                ButtonForSendRequest(
                  urlController: urlController,
                ),
              ],
            );
          }
        },
      ),
    );
  }
}





