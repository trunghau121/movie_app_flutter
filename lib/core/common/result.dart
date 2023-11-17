import 'package:dio/dio.dart';

class Result<T> extends SealedResult<T> {
  bool get isSuccessful => this is Success<T>;
}

class Success<T> extends Result<T> {
  T? data;

  Success(this.data);
}

class Error<T> extends Result<T> {
  String title = "Thông báo";
  String contentError;
  DioExceptionType exceptionType;

  Error(this.contentError, this.exceptionType);
}

abstract class SealedResult<T> {
  R? when<R>({
    R Function(T?)? success,
    R Function(String, DioExceptionType)? error,
  }) {
    if (this is Success<T?>) {
      return success?.call((this as Success<T?>).data);
    }

    if (this is Error<T>) {
      var errorData = (this as Error<T>);
      return error?.call(
        errorData.contentError,
        errorData.exceptionType,
      );
    }

    throw Exception(
        'If you got here, probably you forgot to regenerate the classes? Try running flutter packages pub run build_runner build');
  }
}
