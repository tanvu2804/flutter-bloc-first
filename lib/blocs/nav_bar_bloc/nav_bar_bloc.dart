import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_first/blocs/nav_bar_bloc/nav_bar_event.dart';
import 'package:flutter_bloc_first/blocs/nav_bar_bloc/nav_bar_state.dart';

class NavBarBloc extends Bloc<NavBarEvent, NavBarState> {
  static final int _index = 0;
  NavBarBloc() : super(NavBarState(_index)) {
    on<SelectTabEvent>((event, emit) {
      emit(SelectTabState(event.index));
    });
  }
}
