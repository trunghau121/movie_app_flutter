import 'package:movie_app_flutter/domain/entities/movies_result_entity.dart';
import 'package:movie_app_flutter/domain/usecases/usecase.dart';
import '../../common/result.dart';
import '../entities/no_params.dart';
import '../repositories/movie_repository.dart';

class GetPopular extends UseCase<MoviesResultEntity, NoParams>{
  final MovieRepository movieRepository;

  GetPopular(this.movieRepository);

  @override
  Future<Result<MoviesResultEntity>> call(NoParams params) async{
    return await movieRepository.getPopular();
  }
}