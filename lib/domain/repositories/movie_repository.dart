import '../../common/result.dart';
import '../../data/models/movie_detail_model.dart';
import '../../data/models/movies_result_model.dart';

abstract class MovieRepository{
  Future<Result<MoviesResultModel>> getTrending();
  Future<Result<MoviesResultModel>> getPopular();
  Future<Result<MoviesResultModel>> getPlayingNow();
  Future<Result<MoviesResultModel>> getComingSoon();
  Future<Result<MovieDetailModel>> getDetailMovie(int movieId);
  Future<Result<MoviesResultModel>> getSearchedMovies(String searchTerm);
}