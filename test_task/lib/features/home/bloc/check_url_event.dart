abstract class CheckUrlEvent {
  List<Object> get props => [];
}

class ValidateURLEvent extends CheckUrlEvent{
  final String url;

  ValidateURLEvent(this.url);

  @override
  List<Object> get props => [url];
}

class ShowErrorWithURLEvent extends CheckUrlEvent {
  final String error;

  ShowErrorWithURLEvent(this.error);

  @override
  List<Object> get props => [error];
}
