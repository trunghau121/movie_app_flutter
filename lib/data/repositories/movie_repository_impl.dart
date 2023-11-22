import 'package:dio/dio.dart';
import 'package:movie_app_flutter/common/result.dart';
import 'package:movie_app_flutter/data/data_sources/movie_local_data_source.dart';
import 'package:movie_app_flutter/data/data_sources/movie_remote_data_resource.dart';
import 'package:movie_app_flutter/data/models/cast_result_model.dart';
import 'package:movie_app_flutter/data/models/movie_detail_model.dart';
import 'package:movie_app_flutter/data/models/movies_result_model.dart';
import 'package:movie_app_flutter/data/models/video_model.dart';
import 'package:movie_app_flutter/data/models/video_result_model.dart';
import 'package:movie_app_flutter/domain/entities/cast_entity.dart';
import 'package:movie_app_flutter/domain/entities/movie_entity.dart';
import 'package:movie_app_flutter/domain/repositories/movie_repository.dart';

import '../table/movie_table.dart';

class MovieRepositoryImpl extends MovieRepository{
  final MovieRemoteDataSource remoteDataSource;
  final MovieLocalDataSource localDataSource;

  MovieRepositoryImpl(this.remoteDataSource, this.localDataSource);

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

  @override
  Future<Result<List<CastEntity>>> getCastCrew(int movieId) async{
    var response = await remoteDataSource.getCastCrew(movieId);
    if(response is Success<CastResultModel>){
      return Success(response.data!.cast?? []);
    }else{
      var error = (response as Error<CastResultModel>);
      return Error<List<CastEntity>>(error.contentError, error.exceptionType);
    }
  }

  @override
  Future<Result<List<VideoModel>>> getVideos(int movieId) async{
    var response = await remoteDataSource.getVideos(movieId);
    if(response is Success<VideoResultModel>){
      return Success(response.data!.results?? []);
    }else{
      var error = (response as Error<VideoResultModel>);
      return Error<List<VideoModel>>(error.contentError, error.exceptionType);
    }
  }

  @override
  Future<Result<bool>> checkIfMovieFavorite(int movieId) async{
    try{
      var response = await localDataSource.checkIfMovieFavorite(movieId);
      return Success(response);
    } on Exception catch (exception){
      return Error<bool>(exception.toString(), DioExceptionType.unknown);
    }
  }

  @override
  Future<Result<void>> deleteFavoriteMovie(int movieId) async{
    try{
      var response = await localDataSource.deleteFavoriteMovie(movieId);
      return Success(response);
    } on Exception catch (exception){
      return Error<void>(exception.toString(), DioExceptionType.unknown);
    }
  }

  @override
  Future<Result<List<MovieEntity>>> getFavoriteMovies() async{
    try{
      var response = await localDataSource.getFavoriteMovies();
      return Success(response);
    } on Exception catch (exception){
      return Error<List<MovieEntity>>(exception.toString(), DioExceptionType.unknown);
    }
  }

  @override
  Future<Result<void>> saveMovie(MovieEntity movieEntity) async{
    try{
      var movieTable = MovieTable.fromMovieEntity(movieEntity);
      var response = await localDataSource.saveMovie(movieTable);
      return Success(response);
    } on Exception catch (exception){
      return Error<void>(exception.toString(), DioExceptionType.unknown);
    }
  }

}