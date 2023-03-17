import 'package:movie_app_bloc/data/models/video_model.dart';

class VideoResultModel {
  int? id;
  List<VideoModel>? results;

  VideoResultModel({this.id, this.results});

  VideoResultModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['results'] != null) {
      results = <VideoModel>[];
      json['results'].forEach((v) {
        results!.add(VideoModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


