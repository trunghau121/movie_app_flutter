import 'package:movie_app_flutter/common/result.dart';
import 'package:movie_app_flutter/domain/entities/no_params.dart';
import 'package:movie_app_flutter/domain/repositories/app_repository.dart';
import 'package:movie_app_flutter/domain/usecases/usecase.dart';

class GetLanguage extends UseCase<String, NoParams>{
  final AppRepository appRepository;

  GetLanguage(this.appRepository);
  @override
  Future<Result<String>> call(NoParams params) {
    return appRepository.getPreferredLanguage();
  }

}