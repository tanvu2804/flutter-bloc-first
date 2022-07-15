import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_first/models/video_model.dart';

class YoutubeDetailState extends Equatable {
  final VideoModel videoDetail;

  YoutubeDetailState(this.videoDetail);

  @override
  // TODO: implement props
  List<Object?> get props => [this.videoDetail];
}

class InitialState extends YoutubeDetailState {
  final VideoModel videoDetail;
  @override
  InitialState(this.videoDetail) : super(videoDetail);
}
