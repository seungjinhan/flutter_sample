import 'dart:async';
import 'counter_event.dart';

class CounterBloc {
  int _counter = 0;

  final _counterStateCounter = StreamController<int>(); 
  StreamSink<int> get _inCounter => _counterStateCounter.sink;
  // For state, exposing only a stream which output data
  Stream<int> get counter => _counterStateCounter.stream;

  final _counterEventCountroller = StreamController<CounterEvent>();
  // for events, exposing only a sink which is an input
  Sink<CounterEvent> get counterEventSink => _counterEventCountroller.sink;

  CounterBloc() {
    // Whenever there is a new event, we want to map it to a new state
    _counterEventCountroller.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent) {
      _counter++;
    } else {
      _counter--;
    }

    _inCounter.add(_counter);
  }

  void dispose() {
    _counterEventCountroller.close();
    _counterEventCountroller.close();
  }
}
