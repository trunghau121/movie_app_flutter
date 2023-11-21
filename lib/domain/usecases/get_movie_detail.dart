import 'package:movie_app_flutter/common/result.dart';
import 'package:movie_app_flutter/domain/entities/movie_detail_entity.dart';
import 'package:movie_app_flutter/domain/entities/movie_detail_params.dart';
import 'package:movie_app_flutter/domain/repositories/movie_repository.dart';
import 'package:movie_app_flutter/domain/usecases/usecase.dart';

class GetMovieDetail extends UseCase<MovieDetailEntity, MovieDetailParams>{
  final MovieRepository movieRepository;
  GetMovieDetail(this.movieRepository);
  @override
  Future<Result<MovieDetailEntity>> call(MovieDetailParams params) {
    return movieRepository.getDetailMovie(params.movieId);
  }

}