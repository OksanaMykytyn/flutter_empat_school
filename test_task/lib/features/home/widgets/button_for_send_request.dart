import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/features/home/bloc/check_url_bloc.dart';
import 'package:test_task/features/home/bloc/check_url_event.dart';

class ButtonForSendRequest extends StatelessWidget {
  const ButtonForSendRequest({
    super.key,
    required this.urlController,
  });
  final TextEditingController urlController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              final url = urlController.text;
              BlocProvider.of<CheckUrlBloc>(context).add(ValidateURLEvent(url));
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 21, 90, 210), width: 3),
                  borderRadius: BorderRadius.circular(24),
                  color: const Color.fromARGB(255, 98, 152, 246)),
              height: 60,
              child: const Center(child: Text('Start counting process')),
            ),
          ),
        ],
      ),
    );
  }
}
