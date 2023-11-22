import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/movie_entity.dart';

abstract class MovieTabbedState extends Equatable{
  const MovieTabbedState();
  @override
  List<Object?> get props => [];
}

class MovieTabbedLoading extends MovieTabbedState {}
class MovieTabbedInitial extends MovieTabbedState {}

class MovieTabbedError extends MovieTabbedState {
  final String contentError;
  final DioExceptionType exceptionType;
  const MovieTabbedError(this.contentError, this.exceptionType);
  @override
  List<Object> get props => [contentError, exceptionType];
}

class MovieTabbedLoaded extends MovieTabbedState {
  final List<MovieEntity> movies;

  const MovieTabbedLoaded({
    required this.movies,
  });

  @override
  List<Object> get props => [movies];
}