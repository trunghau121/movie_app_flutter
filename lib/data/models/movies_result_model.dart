import 'package:movie_app_flutter/common/typedefs.dart';
import 'package:movie_app_flutter/data/models/movie_model.dart';

class MoviesResultModel{
  int? page;
  List<MovieModel>? results;
  int? totalPages;
  int? totalResults;

  MoviesResultModel({this.page, this.results, this.totalPages, this.totalResults});

  MoviesResultModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <MovieModel>[];
      json['results'].forEach((v) {
        results!.add(MovieModel.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  JSON toJson() {
    final JSON data = {};
    data['page'] = page;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}