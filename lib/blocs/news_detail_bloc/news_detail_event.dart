import 'package:equatable/equatable.dart';

abstract class NewsDetailEvent extends Equatable {
  const NewsDetailEvent();
}

class LoadNewsDetailEvent extends NewsDetailEvent {
  @override
  List<Object> get props => [];
}
