import 'package:movie_app_flutter/common/typedefs.dart';
import 'package:movie_app_flutter/data/models/movie_detail_model.dart';
import '../../common/result.dart';
import '../remote/base_repository.dart';
import '../remote/remote_client.dart';
import '../models/movies_result_model.dart';
import 'app_local_data_source.dart';

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
  final AppLocalDataSource appLocalDataSource;

  MovieRemoteDataSourceImpl(this._client, this.appLocalDataSource);

  @override
  Future<Result<MoviesResultModel>> getTrending() async{
    String languageCode = await appLocalDataSource.getPreferredLanguage();
    QueryParams params = {
      "language": languageCode
    };
    return getResultApi(
          () => _client.get('trending/movie/day', params, null),
          (JSON json) => MoviesResultModel.fromJson(json),
    );
  }

  @override
  Future<Result<MoviesResultModel>> getPopular() async {
    String languageCode = await appLocalDataSource.getPreferredLanguage();
    QueryParams params = {
      "language": languageCode
    };
    return getResultApi(
            () => _client.get('movie/popular', params, null),
            (JSON json) => MoviesResultModel.fromJson(json),
    );
  }

  @override
  Future<Result<MoviesResultModel>> getComingSoon() async {
    String languageCode = await appLocalDataSource.getPreferredLanguage();
    QueryParams params = {
      "language": languageCode
    };
    return getResultApi(
          () => _client.get('movie/upcoming', params, null),
          (JSON json) => MoviesResultModel.fromJson(json),
    );
  }

  @override
  Future<Result<MoviesResultModel>> getPlayingNow() async {
    String languageCode = await appLocalDataSource.getPreferredLanguage();
    QueryParams params = {
      "language": languageCode
    };
    return getResultApi(
          () => _client.get('movie/now_playing', params, null),
          (JSON json) => MoviesResultModel.fromJson(json),
    );
  }

  @override
  Future<Result<MoviesResultModel>> getSearchedMovies(String searchTerm) async{
    String languageCode = await appLocalDataSource.getPreferredLanguage();
    QueryParams params = {
      'query': searchTerm,
      "language": languageCode
    };
    return getResultApi(
          () => _client.get('search/movie', params, null),
          (JSON json) => MoviesResultModel.fromJson(json),
    );
  }

  @override
  Future<Result<MovieDetailModel>> getDetailMovie(int movieId) async{
    String languageCode = await appLocalDataSource.getPreferredLanguage();
    QueryParams params = {
      "language": languageCode
    };
    return getResultApi(
          () => _client.get('/movie/$movieId', params, null),
          (JSON json) => MovieDetailModel.fromJson(json),
    );
  }
}