import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_flutter/domain/entities/movie_detail_entity.dart';

abstract class MovieDetailState extends Equatable{
  const MovieDetailState();
  @override
  List<Object?> get props => [];
}

class MovieDetailInit extends MovieDetailState{}
class MovieDetailLoading extends MovieDetailState{}

class MovieDetailLoaded extends MovieDetailState{
  final MovieDetailEntity movieDetail;
  const MovieDetailLoaded(this.movieDetail);
  @override
  List<Object?> get props => [movieDetail];
}

class MovieDetailError extends MovieDetailState{
  final String messageError;
  final DioExceptionType type;

  const MovieDetailError({required this.messageError, required this.type});

  @override
  List<Object?> get props => [messageError, type];
}