import 'package:movie_app_flutter/domain/repositories/movie_repository.dart';
import 'package:movie_app_flutter/domain/usecases/usecase.dart';
import '../../common/result.dart';
import '../../data/models/movies_result_model.dart';
import '../entities/no_params.dart';

class GetTrending extends UseCase<MoviesResultModel, NoParams>{
  final MovieRepository movieRepository;

  GetTrending(this.movieRepository);

  @override
  Future<Result<MoviesResultModel>> call(NoParams params) async{
    return await movieRepository.getTrending();
  }

}