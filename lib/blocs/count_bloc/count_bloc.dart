import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_first/blocs/count_bloc/count.dart';

class CountBloc extends Bloc<CountEvent, CountState> {
  static const int _veriable = 0;

  CountBloc() : super(const InitialState(_veriable)) {
    on<CountEvent>((event, emit) {
      if (event is InitialEvent) {
        emit(const InitialState(_veriable));
      } else if (event is PlusEvent) {
        emit(InitialState(event.variable + 1));
      } else if (event is MinusEvent) {
        emit(InitialState(event.variable - 1));
      }
    });
  }
}
