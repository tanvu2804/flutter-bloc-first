import 'package:equatable/equatable.dart';

abstract class YoutubeEvent extends Equatable {
  const YoutubeEvent();
}

class LoadYoutubeEvent extends YoutubeEvent {
  @override
  List<Object> get props => [];
}
