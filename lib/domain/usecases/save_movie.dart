import '../../common/result.dart';
import '../entities/movie_entity.dart';
import '../repositories/movie_repository.dart';
import 'usecase.dart';

class SaveMovie extends UseCase<void, MovieEntity> {
  final MovieRepository movieRepository;
  SaveMovie(this.movieRepository);

  @override
  Future<Result<void>> call(MovieEntity params) async {
    return await movieRepository.saveMovie(params);
  }
}
