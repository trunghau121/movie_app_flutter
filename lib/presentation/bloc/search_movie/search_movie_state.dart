import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/movie_entity.dart';

abstract class SearchMovieState extends Equatable{
  @override
  List<Object?> get props => [];
}

class SearchMovieInit extends SearchMovieState{}
class SearchMovieLoading extends SearchMovieState{}
class SearchMovieLoaded extends SearchMovieState{
  final List<MovieEntity> movieEntities;
  SearchMovieLoaded(this.movieEntities);
}

class SearchMovieError extends SearchMovieState{
  final String message;
  final DioExceptionType type;
  SearchMovieError(this.message, this.type);
}