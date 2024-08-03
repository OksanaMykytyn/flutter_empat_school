import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/features/home/bloc/check_url_bloc.dart';
import 'package:test_task/features/result/result.dart';
import 'package:test_task/repository/get_data.dart';
import 'package:test_task/repository/response.dart';

class LoadingData extends StatelessWidget {
  const LoadingData({super.key});

  @override
  Widget build(BuildContext context) {
    final url = BlocProvider.of<CheckUrlBloc>(context).baseURL;

    if (url == null) {
      return const Center(child: Text('URL is not available'));
    }

    return FutureBuilder<ApiResponse>(
      future: _fetchData(url),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Progress...',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const CircularProgressIndicator(),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          return Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        'All calculations have finished, you can send your results to the server',
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      '100%',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const CircularProgressIndicator(value: 1.0),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ResultScreen()));
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 21, 90, 210),
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(24),
                      color: const Color.fromARGB(255, 98, 152, 246),
                    ),
                    height: 60,
                    child: const Center(
                      child: Text(
                        'Send result to server',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          return const Center(child: Text('No data available'));
        }
      },
    );
  }

  Future<ApiResponse> _fetchData(String url) async {
    ApiService apiService = ApiService(url: url);
    return await apiService.fetchData();
  }
}
