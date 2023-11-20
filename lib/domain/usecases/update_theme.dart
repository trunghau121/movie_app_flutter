import 'package:movie_app_flutter/common/result.dart';
import 'package:movie_app_flutter/domain/repositories/app_repository.dart';
import 'package:movie_app_flutter/domain/usecases/usecase.dart';

class UpdateTheme extends UseCase<void, String>{
  final AppRepository appRepository;
  UpdateTheme(this.appRepository);
  @override
  Future<Result<void>> call(String params) {
    return appRepository.updateTheme(params);
  }

}