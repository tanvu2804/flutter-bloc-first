import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_first/models/index.dart';

abstract class NewsState extends Equatable {}

class NewsLoadingState extends NewsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NewsLoadedState extends NewsState {
  final NewsModel news;

  NewsLoadedState(this.news);

  @override
  // TODO: implement props
  List<Object?> get props => [news];
}

class NewsErrorState extends NewsState {
  final String error;

  NewsErrorState(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
