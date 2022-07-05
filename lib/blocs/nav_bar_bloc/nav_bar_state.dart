import 'package:equatable/equatable.dart';

class NavBarState extends Equatable {
  final int index;

  NavBarState(this.index);
  @override
  // TODO: implement props
  List<Object?> get props => [index];
}

class SelectTabState extends NavBarState {
  final int index;

  SelectTabState(this.index) : super(index);
}
