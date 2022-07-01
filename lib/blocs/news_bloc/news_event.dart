import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class LoadNewsEvent extends NewsEvent {
  @override
  List<Object> get props => [];
}
