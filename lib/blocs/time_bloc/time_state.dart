import 'package:equatable/equatable.dart';

class TimeState extends Equatable {
  final int timeDuration;

  const TimeState(this.timeDuration);

  @override
  // TODO: implement props
  List<Object?> get props => [timeDuration];
}

class InitialState extends TimeState {
  @override
  final int timeDuration;

  const InitialState(this.timeDuration) : super(timeDuration);
}

class RunningState extends TimeState {
  @override
  final int timeDuration;
  const RunningState(this.timeDuration) : super(timeDuration);
}

class PauseState extends TimeState {
  @override
  final int timeDuration;

  const PauseState(this.timeDuration) : super(timeDuration);
}

class CompletedState extends TimeState {
  const CompletedState() : super(0);
}
