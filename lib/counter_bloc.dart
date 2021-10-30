import 'dart:async';

enum CounterAction { increment, decrement, reset }

class CounterBloc {
  int counter = 0;

  final _stateStreamController = StreamController<int>();

  StreamSink<int> get counterSink => _stateStreamController.sink;
  Stream<int> get counterStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<CounterAction>();

  StreamSink<CounterAction> get eventSink => _eventStreamController.sink;
  Stream<CounterAction> get eventStream => _eventStreamController.stream;

  CounterBloc() {
    counter = 0;

    eventStream.listen((count) {
      if (count == CounterAction.increment) {
        counter++;
      } else if (count == CounterAction.decrement) {
        counter--;
      } else {
        counter = 0;
      }

      counterSink.add(counter);
    });
  }
}
