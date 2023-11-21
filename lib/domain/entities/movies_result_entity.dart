import 'package:movie_app_flutter/domain/entities/movie_entity.dart';

abstract class MoviesResultEntity{
  final int currentPage;
  final List<MovieEntity> data;
  final int totalCountPages;

  MoviesResultEntity({required this.currentPage, required this.data, required this.totalCountPages});
}