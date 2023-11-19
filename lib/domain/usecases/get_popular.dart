import 'package:movie_app_flutter/domain/usecases/usecase.dart';
import '../../common/result.dart';
import '../../data/models/movies_result_model.dart';
import '../entities/no_params.dart';
import '../repositories/movie_repository.dart';

class GetPopular extends UseCase<MoviesResultModel, NoParams>{
  final MovieRepository movieRepository;

  GetPopular(this.movieRepository);

  @override
  Future<Result<MoviesResultModel>> call(NoParams params) async{
    return await movieRepository.getPopular();
  }
}