abstract class CheckUrlState{
  List<Object> get props => [];
}

class InitialState extends CheckUrlState{}

class UrlValidState extends CheckUrlState {
  final String baseURL;

  UrlValidState(this.baseURL);

  @override
  List<Object> get props => [baseURL];
}

class UrlErrorState extends CheckUrlState {
  final String message;

  UrlErrorState(this.message);

  @override
  List<Object> get props => [message];
}
