import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/features/home/bloc/check_url_bloc.dart';
import 'package:test_task/features/home/bloc/check_url_state.dart';

class PartForInputRequest extends StatelessWidget {
  const PartForInputRequest({
    super.key,
    required this.sizeTextField,
    required this.urlController,
  });

  final double sizeTextField;
  final TextEditingController urlController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 12),
      child: Column(
        children: [
          const Row(
            children: [Text('Set valid API base URL in order to continue')],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.compare_arrows),
              SizedBox(
                  width: sizeTextField,
                  child: BlocBuilder<CheckUrlBloc, CheckUrlState>(
                    builder: (context, state) {
                      return TextFormField(
                        controller: urlController,
                        decoration: InputDecoration(
                          border: const UnderlineInputBorder(),
                          errorText:
                              state is UrlErrorState ? 'Invalid URL' : null,
                        ),
                      );
                    },
                  )),
            ],
          )
        ],
      ),
    );
  }
}
