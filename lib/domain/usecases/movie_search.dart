import 'package:movie_app_flutter/common/result.dart';
import 'package:movie_app_flutter/data/models/movies_result_model.dart';
import '../entities/movie_search_params.dart';
import '../repositories/movie_repository.dart';
import 'usecase.dart';

class SearchMovies extends UseCase<MoviesResultModel, MovieSearchParams> {
  final MovieRepository repository;

  SearchMovies(this.repository);

  @override
  Future<Result<MoviesResultModel>> call(MovieSearchParams params) async {
    return await repository.getSearchedMovies(params.searchTerm);
  }
}
