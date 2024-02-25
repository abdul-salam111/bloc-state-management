import 'package:bloc/bloc.dart';
import 'package:blocstate_mgt/bloc/counter_bloc/counter_event.dart';
import 'package:blocstate_mgt/bloc/counter_bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState()) {
    on<IncreamentCounter>(increment);
    on<DecreamentCounter>(decremenet);
  }

  void increment(IncreamentCounter event, Emitter<CounterState> emit){
    emit(state.copyWith(counter: state.counter+1));
  }
  void decremenet(DecreamentCounter event, Emitter<CounterState> emit){
    emit(state.copyWith(counter: state.counter>0?state.counter-1:state.counter));
  }
}
