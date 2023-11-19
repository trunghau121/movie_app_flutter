import 'package:movie_app_flutter/common/result.dart';

abstract class UseCase<Type, Params> {
  Future<Result<Type>> call(Params params);
}
