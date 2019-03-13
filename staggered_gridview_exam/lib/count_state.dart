class CountState {
  int counter;

  CountState({this.counter});

  factory CountState.initial() => CountState(counter: 0);
}
