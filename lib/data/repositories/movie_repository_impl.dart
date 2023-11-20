import 'package:movie_app_flutter/common/result.dart';
import 'package:movie_app_flutter/data/data_sources/movie_remote_data_resource.dart';
import 'package:movie_app_flutter/data/models/movie_detail_model.dart';
import 'package:movie_app_flutter/data/models/movies_result_model.dart';
import 'package:movie_app_flutter/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository{
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<Result<MoviesResultModel>> getTrending() async{
    return remoteDataSource.getTrending();
  }

  @override
  Future<Result<MoviesResultModel>> getComingSoon() async{
    return remoteDataSource.getComingSoon();
  }

  @override
  Future<Result<MoviesResultModel>> getPlayingNow() async{
    return remoteDataSource.getPlayingNow();
  }

  @override
  Future<Result<MoviesResultModel>> getPopular() async{
    return remoteDataSource.getPopular();
  }

  @override
  Future<Result<MoviesResultModel>> getSearchedMovies(String searchTerm) async{
    return remoteDataSource.getSearchedMovies(searchTerm);
  }

  @override
  Future<Result<MovieDetailModel>> getDetailMovie(int movieId) {
    return remoteDataSource.getDetailMovie(movieId);
  }

}