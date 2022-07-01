import 'package:equatable/equatable.dart';

class CountEvent extends Equatable {
  const CountEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialEvent extends CountEvent {
  final int variable;
  const InitialEvent(this.variable);
}

class PlusEvent extends CountEvent {
  final int variable;
  const PlusEvent(this.variable);
}

class MinusEvent extends CountEvent {
  final int variable;
  const MinusEvent(this.variable);
}
