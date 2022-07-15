import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_first/models/video_model.dart';

class YoutubeDetailEvent extends Equatable {
  const YoutubeDetailEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialEvent extends YoutubeDetailEvent {
  final VideoModel videoDetail;
  const InitialEvent(this.videoDetail);
}
