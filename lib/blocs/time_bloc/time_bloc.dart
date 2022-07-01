import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'time.dart';

class TimeBloc extends Bloc<TimeEvent, TimeState> {
  static const int _timeDuration = 60;

  TimeBloc() : super(const InitialState(_timeDuration)) {
    StreamSubscription? _timeSubscription;
    on<TimeEvent>((event, emit) async {
      if (event is StartEvent) {
        emit(RunningState(event.timeDuration));
        _timeSubscription =
            changeTime(event.timeDuration).listen((timeDuration) {
          return add(RunEvent(timeDuration));
        });
      } else if (event is RunEvent) {
        emit(event.timeDuration > 0
            ? RunningState(event.timeDuration)
            : const CompletedState());
      } else if (event is PauseEvent) {
        _timeSubscription?.pause();
        emit(PauseState(state.timeDuration));
      } else if (event is ResumeEvent) {
        _timeSubscription!.resume();
        emit(RunningState(state.timeDuration));
      } else if (event is ResetEvent) {
        _timeSubscription!.cancel();
        emit(const InitialState(_timeDuration));
      }
    });
  }
  Stream<int> changeTime(int time) {
    return Stream.periodic(const Duration(seconds: 1), (x) => time - x - 1)
        .take(time);
  }
}
