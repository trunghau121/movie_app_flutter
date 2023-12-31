import 'package:movie_app_flutter/common/result.dart';

abstract class AppRepository {
  Future<Result<void>> updateLanguage(String language);
  Future<Result<String>> getPreferredLanguage();
  Future<Result<void>> updateTheme(String theme);
  Future<Result<String>> getPreferredTheme();
}