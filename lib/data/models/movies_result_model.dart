import 'package:movie_app_flutter/common/typedefs.dart';
import 'package:movie_app_flutter/common/utils/extensions.dart';
import 'package:movie_app_flutter/data/models/movie_model.dart';
import '../../domain/entities/movies_result_entity.dart';

class MoviesResultModel extends MoviesResultEntity {
  int? page;
  List<MovieModel>? results;
  int? totalPages;
  int? totalResults;

  MoviesResultModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  }) : super(
          currentPage: page.value(),
          data: results ?? [],
          totalCountPages: totalPages.value(),
        );

  factory MoviesResultModel.fromJson(Map<String, dynamic> json) {
    var data = <MovieModel>[];
    if (json['results'] != null) {
      json['results'].forEach((v) {
        data.add(MovieModel.fromJson(v));
      });
    }
    return MoviesResultModel(
      page: json['page'],
      results: data,
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
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
