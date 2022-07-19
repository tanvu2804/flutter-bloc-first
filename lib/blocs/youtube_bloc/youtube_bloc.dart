import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_first/blocs/youtube_bloc/youtube.dart';
import 'package:flutter_bloc_first/data/repository/index.dart';
import 'package:flutter_bloc_first/models/video_model.dart';

class YoutubeBloc extends Bloc<YoutubeEvent, YoutubeState> {
  final ApiServiceRepository _apiServiceRepository;
  YoutubeBloc(this._apiServiceRepository) : super(YoutubeLoadingState()) {
    List<VideoModel> listModel = [];
    on<LoadYoutubeEvent>((event, emit) async {
      listModel.clear;
      emit(YoutubeLoadingState());
      try {
        await _apiServiceRepository.listVideo().then((value) {
          if (value != null) {
            if (value['error'] == 0) {
              value['data'].forEach((value) {
                VideoModel videoModel = VideoModel.fromJson(value);
                listModel.add(videoModel);
              });
              print(listModel);
              emit(YoutubeLoadedState(listModel));
            }
          }
        });
      } catch (e) {
        emit(YoutubeErrorState(e.toString()));
      }
    });
  }
}
