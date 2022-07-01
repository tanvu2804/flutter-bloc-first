import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_first/blocs/news_bloc/news.dart';
import 'package:flutter_bloc_first/data/repository/index.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final ApiServiceRepository _apiServiceRepository;
  NewsBloc(this._apiServiceRepository) : super(NewsLoadingState()) {
    on<LoadNewsEvent>((event, emit) async {
      emit(NewsLoadingState());
      try {
        final news = await _apiServiceRepository.listNews();
        emit(NewsLoadedState(news!));
      } catch (e) {
        emit(NewsErrorState(e.toString()));
      }
    });
  }
}
