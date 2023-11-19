import 'package:dio/dio.dart';
import '../../common/result.dart';
import '../../domain/repositories/app_repository.dart';
import '../data_sources/language_local_data_source.dart';

class AppRepositoryImpl extends AppRepository {
  final LanguageLocalDataSource languageLocalDataSource;
  AppRepositoryImpl(this.languageLocalDataSource);

  @override
  Future<Result<String>> getPreferredLanguage() async {
    try {
      final response = await languageLocalDataSource.getPreferredLanguage();
      return Success(response);
    } on Exception {
      return Error("Lỗi lấy ngôn ngữ", DioExceptionType.unknown);
    }
  }

  @override
  Future<Result<void>> updateLanguage(String language) async {
    try {
      final response = await languageLocalDataSource.updateLanguage(language);
      return Success(response);
    } on Exception {
      return Error("Lỗi cập nhật ngôn ngữ", DioExceptionType.unknown);
    }
  }
}
