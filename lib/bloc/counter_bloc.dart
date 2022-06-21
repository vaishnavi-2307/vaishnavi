import 'package:bloc/bloc.dart';

enum CounterEvent { Increment, Decrement, Reset }

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.Increment:
        yield state + 1;
        break;
      case CounterEvent.Decrement:
        if (state > 0) yield state - 1;
        break;
      case CounterEvent.Reset:
        yield state * 0;
        break;
    }
  }
}
