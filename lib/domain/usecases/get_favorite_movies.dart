import '../../common/result.dart';
import '../entities/movie_entity.dart';
import '../entities/no_params.dart';
import '../repositories/movie_repository.dart';
import 'usecase.dart';

class GetFavoriteMovies extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository movieRepository;
  GetFavoriteMovies(this.movieRepository);

  @override
  Future<Result<List<MovieEntity>>> call(NoParams params) async {
    return await movieRepository.getFavoriteMovies();
  }
}
