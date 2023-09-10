import 'dart:async';

import 'package:flutter_counter_bloc_vanilla/counter_event.dart';

class CounterBloc {
  CounterBloc() {
    _counterEventController.stream.listen(mapEventToState);
  }

  int _counter = 0;

  final _counterStateController = StreamController<int>();
  StreamSink<int> get _inCounter => _counterStateController.sink;

  Stream<int> get counter => _counterStateController.stream;

  final _counterEventController = StreamController<CounterEvent>();
  StreamSink<CounterEvent> get counterEventSink => _counterEventController.sink;

  void mapEventToState(event) {
    if (event is CounterIncremented) {
      _counter++;
    } else {
      _counter--;
    }
    _inCounter.add(_counter);
  }

  void dispose() {
    _counterEventController.close();
    _counterStateController.close();
  }
}
