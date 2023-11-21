import 'package:movie_app_flutter/domain/entities/cast_entity.dart';
import 'package:movie_app_flutter/domain/entities/video_entity.dart';
import '../../common/result.dart';
import '../entities/movie_detail_entity.dart';
import '../entities/movies_result_entity.dart';

abstract class MovieRepository{
  Future<Result<MoviesResultEntity>> getTrending();
  Future<Result<MoviesResultEntity>> getPopular();
  Future<Result<MoviesResultEntity>> getPlayingNow();
  Future<Result<MoviesResultEntity>> getComingSoon();
  Future<Result<MovieDetailEntity>> getDetailMovie(int movieId);
  Future<Result<List<CastEntity>>> getCastCrew(int movieId);
  Future<Result<MoviesResultEntity>> getSearchedMovies(String searchTerm);
  Future<Result<List<VideoEntity>>> getVideos(int movieId);
}