import 'package:movie_app_flutter/common/result.dart';
import 'package:movie_app_flutter/domain/entities/cast_entity.dart';
import 'package:movie_app_flutter/domain/repositories/movie_repository.dart';
import 'package:movie_app_flutter/domain/usecases/usecase.dart';

class GetCastCrew extends UseCase<List<CastEntity>, int>{
  final MovieRepository movieRepository;
  GetCastCrew(this.movieRepository);
  @override
  Future<Result<List<CastEntity>>> call(int params) {
    return movieRepository.getCastCrew(params);
  }

}