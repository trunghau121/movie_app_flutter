import 'package:movie_app_flutter/common/result.dart';
import 'package:movie_app_flutter/domain/repositories/app_repository.dart';
import 'package:movie_app_flutter/domain/usecases/usecase.dart';
import '../entities/update_language_params.dart';

class UpdateLanguage extends UseCase<void, UpdateLanguageParams>{
  final AppRepository appRepository;
  UpdateLanguage({required this.appRepository});
  @override
  Future<Result<void>> call(UpdateLanguageParams params) {
    return appRepository.updateLanguage(params.code);
  }

}