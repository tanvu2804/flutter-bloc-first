import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_first/blocs/news_bloc/news.dart';
import 'package:flutter_bloc_first/data/repository/index.dart';
import 'package:flutter_bloc_first/models/index.dart';
import 'package:flutter_bloc_first/models/news_model.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final ApiServiceRepository _apiServiceRepository;
  NewsBloc(this._apiServiceRepository) : super(NewsLoadingState()) {
    List<NewsModel> listModel = [];
    on<LoadNewsEvent>((event, emit) async {
      listModel.clear;
      emit(NewsLoadingState());
      try {
        await _apiServiceRepository.listNews().then((value) {
          if (value != null) {
            if (value['status'] == "ok") {
              value['articles'].forEach((value) {
                NewsModel newsModel = NewsModel.fromJson(value);
                listModel.add(newsModel);
              });
              emit(NewsLoadedState(listModel));
            }
          }
        });
      } catch (e) {
        emit(NewsErrorState(e.toString()));
      }
    });
  }
}
