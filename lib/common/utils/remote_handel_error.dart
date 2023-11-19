import 'package:dio/dio.dart';
import '../../common/result.dart';

class RemoteHandelError implements Exception {
  late String errorMessage;
  static const String defaultErrorMessage = 'Có lỗi xảy ra, vui lòng thử lại!';
  static const String defaultErrorInternet = 'Không có kết nối mạng, vui lòng thử lại!';

  Error<T> fromRemoteError<T>(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        errorMessage = "Kết nối mạng yếu, vui lòng thử lại!";
        break;
      case DioExceptionType.badResponse:
        errorMessage = _handleStatusCode(dioError.response);
        break;
      case DioExceptionType.unknown:
        if (dioError.message != null && dioError.message!.contains('SocketException')) {
          errorMessage = defaultErrorInternet;
          break;
        }
        errorMessage = defaultErrorMessage;
        break;
      default:
        errorMessage = defaultErrorMessage;
        break;
    }
    return Error<T>(errorMessage, dioError.type);
  }

  String _handleStatusCode(Response? response) {
    if(response != null){
      return response.data["status_message"];
    }
    return defaultErrorMessage;
  }

  @override
  String toString() => errorMessage;
}
