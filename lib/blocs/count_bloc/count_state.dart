import 'package:equatable/equatable.dart';

class CountState extends Equatable {
  final int variable;
  const CountState(this.variable);
  @override
  // TODO: implement props
  List<Object?> get props => [variable];
}

class InitialState extends CountState {
  @override
  final int variable;
  const InitialState(this.variable) : super(variable);
}

class PlusState extends CountState {
  @override
  final int variable;
  const PlusState(this.variable) : super(variable);
}

class MinusState extends CountState {
  @override
  final int variable;
  const MinusState(this.variable) : super(variable);
}
