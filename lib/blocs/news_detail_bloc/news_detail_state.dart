import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_first/models/index.dart';

abstract class NewsDetailState extends Equatable {}

class NewsDetailLoadingState extends NewsDetailState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NewsDetailLoadedState extends NewsDetailState {
  final NewsModel newsDetail;

  NewsDetailLoadedState(this.newsDetail);

  @override
  // TODO: implement props
  List<Object?> get props => [newsDetail];
}
