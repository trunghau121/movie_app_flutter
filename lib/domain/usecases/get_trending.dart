import 'package:movie_app_flutter/domain/entities/movies_result_entity.dart';
import 'package:movie_app_flutter/domain/repositories/movie_repository.dart';
import 'package:movie_app_flutter/domain/usecases/usecase.dart';
import '../../common/result.dart';
import '../entities/no_params.dart';

class GetTrending extends UseCase<MoviesResultEntity, NoParams>{
  final MovieRepository movieRepository;

  GetTrending(this.movieRepository);

  @override
  Future<Result<MoviesResultEntity>> call(NoParams params) async{
    return await movieRepository.getTrending();
  }

}