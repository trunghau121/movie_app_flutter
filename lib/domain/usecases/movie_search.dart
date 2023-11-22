import 'package:movie_app_flutter/common/result.dart';
import '../entities/movie_search_params.dart';
import '../entities/movies_result_entity.dart';
import '../repositories/movie_repository.dart';
import 'usecase.dart';

class SearchMovies extends UseCase<MoviesResultEntity, MovieSearchParams> {
  final MovieRepository repository;
  SearchMovies(this.repository);

  @override
  Future<Result<MoviesResultEntity>> call(MovieSearchParams params) {
    return repository.getSearchedMovies(params.searchTerm);
  }
}
