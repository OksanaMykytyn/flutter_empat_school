class ConstructorEvent {}

class SelectPageEvent extends ConstructorEvent {
  final int step;

  SelectPageEvent({required this.step});
}

class LoadWrappersList extends ConstructorEvent {}

class LoadSweetsList extends ConstructorEvent {}

class LoadComicsList extends ConstructorEvent {}
