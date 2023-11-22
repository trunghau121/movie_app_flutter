import 'package:movie_app_flutter/common/result.dart';
import '../entities/movie_params.dart';
import '../repositories/movie_repository.dart';
import 'usecase.dart';

class DeleteFavoriteMovie extends UseCase<void, MovieParams> {
  final MovieRepository movieRepository;
  DeleteFavoriteMovie(this.movieRepository);

  @override
  Future<Result<void>> call(MovieParams movieParams) async {
    return await movieRepository.deleteFavoriteMovie(movieParams.id);
  }
}
