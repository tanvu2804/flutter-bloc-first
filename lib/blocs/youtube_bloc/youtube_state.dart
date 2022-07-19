import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_first/models/video_model.dart';

abstract class YoutubeState extends Equatable {}

class YoutubeLoadingState extends YoutubeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class YoutubeLoadedState extends YoutubeState {
  final List<VideoModel> video;

  YoutubeLoadedState(this.video);

  @override
  // TODO: implement props
  List<Object?> get props => [video];
}

class YoutubeErrorState extends YoutubeState {
  final String error;

  YoutubeErrorState(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
