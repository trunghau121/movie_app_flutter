import 'package:movie_app_flutter/domain/entities/movies_result_entity.dart';
import 'package:movie_app_flutter/domain/entities/no_params.dart';
import 'package:movie_app_flutter/domain/usecases/usecase.dart';
import '../../common/result.dart';
import '../repositories/movie_repository.dart';

class GetComingSoon extends UseCase<MoviesResultEntity, NoParams>{
  final MovieRepository movieRepository;

  GetComingSoon(this.movieRepository);

  @override
  Future<Result<MoviesResultEntity>> call(NoParams params){
    return movieRepository.getComingSoon();
  }
}