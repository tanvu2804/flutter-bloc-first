import 'package:equatable/equatable.dart';

abstract class NavBarEvent extends Equatable {
  NavBarEvent();
   @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SelectTabEvent extends NavBarEvent{
  final int index;
  SelectTabEvent(this.index);
}