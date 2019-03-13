import 'package:staggered_gridview_exam/counter_event.dart';
import 'count_state.dart';
import 'package:bloc/bloc.dart';

class CounterBloc2 extends Bloc<CounterEvent, CountState> {
  void onIncrement() {
    dispatch(IncrementEvent());
  }

  void onDecrement() {
    dispatch(DecrementEvent());
  }

  @override
  CountState get initialState => CountState.initial();

  @override
  Stream<CountState> mapEventToState(CountState currentState, CounterEvent event) async* {
    if (event is IncrementEvent) {
      yield CountState(counter: currentState.counter + 1);
    } else if (event is DecrementEvent) {
      yield CountState(counter: currentState.counter - 1);
    }
  }
}
