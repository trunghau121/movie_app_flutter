import '../../common/result.dart';
import '../../data/models/movies_result_model.dart';

abstract class MovieRepository{
  Future<Result<MoviesResultModel>> getTrending();
  Future<Result<MoviesResultModel>> getPopular();
  Future<Result<MoviesResultModel>> getPlayingNow();
  Future<Result<MoviesResultModel>> getComingSoon();
  Future<Result<MoviesResultModel>> getSearchedMovies(String searchTerm);
}