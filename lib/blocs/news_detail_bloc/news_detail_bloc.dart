import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_first/blocs/news_detail_bloc/news_detail.dart';
import 'package:flutter_bloc_first/models/index.dart';

class NewsDetailBloc extends Bloc<NewsDetailEvent, NewsDetailState> {
  NewsModel newsDetail;
  NewsDetailBloc(this.newsDetail) : super(NewsDetailLoadingState()) {
    on<LoadNewsDetailEvent>((event, emit) {
      emit(NewsDetailLoadedState(newsDetail));
    });
  }
}
