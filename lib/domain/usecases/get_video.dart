import 'package:movie_app_flutter/common/result.dart';
import 'package:movie_app_flutter/domain/entities/video_entity.dart';
import 'package:movie_app_flutter/domain/repositories/movie_repository.dart';
import 'package:movie_app_flutter/domain/usecases/usecase.dart';

class GetVideo extends UseCase<List<VideoEntity>, int>{
  final MovieRepository movieRepository;
  GetVideo(this.movieRepository);

  @override
  Future<Result<List<VideoEntity>>> call(int params) {
    return movieRepository.getVideos(params);
  }

}