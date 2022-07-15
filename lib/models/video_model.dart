// To parse this JSON data, do
//
//     final videoModel = videoModelFromJson(jsonString);

import 'dart:convert';

VideoModel videoModelFromJson(str) =>
    VideoModel.fromJson(str);

String videoModelToJson(VideoModel data) => json.encode(data.toJson());

class VideoModel {
  VideoModel({
    this.id,
    this.thumnailImg,
    this.profileImg,
    this.username,
    this.title,
    this.viewCount,
    this.dayAgo,
    this.subscriberCount,
    this.likeCount,
    this.unlikeCount,
    this.videoUrl,
  });

  int? id;
  String? thumnailImg;
  String? profileImg;
  String? username;
  String? title;
  String? viewCount;
  String? dayAgo;
  String? subscriberCount;
  String? likeCount;
  String? unlikeCount;
  String? videoUrl;

  VideoModel copyWith({
    int? id,
    String? thumnailImg,
    String? profileImg,
    String? username,
    String? title,
    String? viewCount,
    String? dayAgo,
    String? subscriberCount,
    String? likeCount,
    String? unlikeCount,
    String? videoUrl,
  }) =>
      VideoModel(
        id: id ?? this.id,
        thumnailImg: thumnailImg ?? this.thumnailImg,
        profileImg: profileImg ?? this.profileImg,
        username: username ?? this.username,
        title: title ?? this.title,
        viewCount: viewCount ?? this.viewCount,
        dayAgo: dayAgo ?? this.dayAgo,
        subscriberCount: subscriberCount ?? this.subscriberCount,
        likeCount: likeCount ?? this.likeCount,
        unlikeCount: unlikeCount ?? this.unlikeCount,
        videoUrl: videoUrl ?? this.videoUrl,
      );

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        id: json["id"],
        thumnailImg: json["thumnail_img"],
        profileImg: json["profile_img"],
        username: json["username"],
        title: json["title"],
        viewCount: json["view_count"],
        dayAgo: json["day_ago"],
        subscriberCount: json["subscriber_count"],
        likeCount: json["like_count"],
        unlikeCount: json["unlike_count"],
        videoUrl: json["video_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "thumnail_img": thumnailImg,
        "profile_img": profileImg,
        "username": username,
        "title": title,
        "view_count": viewCount,
        "day_ago": dayAgo,
        "subscriber_count": subscriberCount,
        "like_count": likeCount,
        "unlike_count": unlikeCount,
        "video_url": videoUrl,
      };
}
