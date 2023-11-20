import 'package:dio/dio.dart';
import '../../common/result.dart';
import '../../domain/repositories/app_repository.dart';
import '../data_sources/app_local_data_source.dart';

class AppRepositoryImpl extends AppRepository {
  final AppLocalDataSource appLocalDataSource;
  AppRepositoryImpl(this.appLocalDataSource);

  @override
  Future<Result<String>> getPreferredLanguage() async {
    try {
      final response = await appLocalDataSource.getPreferredLanguage();
      return Success(response);
    } on Exception {
      return Error("Lỗi lấy ngôn ngữ", DioExceptionType.unknown);
    }
  }

  @override
  Future<Result<void>> updateLanguage(String language) async {
    try {
      final response = await appLocalDataSource.updateLanguage(language);
      return Success(response);
    } on Exception {
      return Error("Lỗi cập nhật ngôn ngữ", DioExceptionType.unknown);
    }
  }

  @override
  Future<Result<String>> getPreferredTheme() async{
    try {
      final response = await appLocalDataSource.getPreferredTheme();
      return Success(response);
    } on Exception {
      return Error("Lỗi lấy theme", DioExceptionType.unknown);
    }
  }

  @override
  Future<Result<void>> updateTheme(String theme) async{
    try {
      final response = await appLocalDataSource.updateTheme(theme);
      return Success(response);
    } on Exception {
      return Error("Lỗi cập nhật theme", DioExceptionType.unknown);
    }
  }
}
