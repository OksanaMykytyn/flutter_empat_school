import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/features/home/bloc/check_url_event.dart';
import 'package:test_task/features/home/bloc/check_url_state.dart';

class CheckUrlBloc extends Bloc<CheckUrlEvent, CheckUrlState> {
  CheckUrlBloc() : super(InitialState()) {
    on<ValidateURLEvent>(_onValidateUrl);
    on<ShowErrorWithURLEvent>(_onShowErrorWithURL);
  }

  String? get baseURL {
    if (state is UrlValidState) {
      return (state as UrlValidState).baseURL;
    }
    return null; 
  }

  void _onValidateUrl(ValidateURLEvent event, Emitter<CheckUrlState> emit) {
    final isValid = _isValidURL(event.url);
    if (isValid) {
      emit(UrlValidState(event.url));
    } else {
      emit(UrlErrorState("Invalid URL"));
    }
  }

  void _onShowErrorWithURL(ShowErrorWithURLEvent event, Emitter<CheckUrlState> emit) {
    emit(UrlErrorState(event.error));
  }

  _isValidURL(String url) {
    var urlPattern =
        r"(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?";
    var match = RegExp(urlPattern, caseSensitive: false);
    return match.hasMatch(url);
  }
}
