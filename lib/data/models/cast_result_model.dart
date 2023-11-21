import 'package:movie_app_flutter/data/models/cast_model.dart';

class CastResultModel {
  int? id;
  List<CastModel>? cast;

  CastResultModel({this.id, this.cast});

  CastResultModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['cast'] != null) {
      cast = <CastModel>[];
      json['cast'].forEach((v) {
        cast!.add(CastModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cast'] =cast != null ? cast!.map((v) => v.toJson()).toList() : null;
    return data;
  }
}