import 'package:movie_app_flutter/common/typedefs.dart';
import 'package:movie_app_flutter/data/models/movie_detail_model.dart';
import '../../common/result.dart';
import '../remote/base_repository.dart';
import '../remote/remote_client.dart';
import '../models/movies_result_model.dart';

abstract class MovieRemoteDataSource extends BaseRepository {
  Future<Result<MoviesResultModel>> getTrending();
  Future<Result<MoviesResultModel>> getPopular();
  Future<Result<MoviesResultModel>> getPlayingNow();
  Future<Result<MoviesResultModel>> getComingSoon();
  Future<Result<MovieDetailModel>> getDetailMovie(int movieId);
  Future<Result<MoviesResultModel>> getSearchedMovies(String searchTerm);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final RemoteClient _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<Result<MoviesResultModel>> getTrending() async{
    return getResultApi(
          () => _client.get('trending/movie/day', null, null),
          (JSON json) => MoviesResultModel.fromJson(json),
    );
  }

  @override
  Future<Result<MoviesResultModel>> getPopular() async {
    return getResultApi(
            () => _client.get('movie/popular', null, null),
            (JSON json) => MoviesResultModel.fromJson(json),
    );
  }

  @override
  Future<Result<MoviesResultModel>> getComingSoon() async {
    return getResultApi(
          () => _client.get('movie/upcoming', null, null),
          (JSON json) => MoviesResultModel.fromJson(json),
    );
  }

  @override
  Future<Result<MoviesResultModel>> getPlayingNow() async {
    return getResultApi(
          () => _client.get('movie/now_playing', null, null),
          (JSON json) => MoviesResultModel.fromJson(json),
    );
  }

  @override
  Future<Result<MoviesResultModel>> getSearchedMovies(String searchTerm) {
    QueryParams params = {
      'query': searchTerm,
    };
    return getResultApi(
          () => _client.get('search/movie', params, null),
          (JSON json) => MoviesResultModel.fromJson(json),
    );
  }

  @override
  Future<Result<MovieDetailModel>> getDetailMovie(int movieId) {
    return getResultApi(
          () => _client.get('/movie/$movieId', null, null),
          (JSON json) => MovieDetailModel.fromJson(json),
    );
  }
}