import 'package:dio/dio.dart';
import 'package:movie_app_flutter/common/constants/languages.dart';
import '../../common/result.dart';

class RemoteHandelError implements Exception {
  late String errorMessage;

  Error<T> fromRemoteError<T>(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        errorMessage = Languages.lowConnectNetwork;
        break;
      case DioExceptionType.badResponse:
        errorMessage = _handleStatusCode(dioError.response);
        break;
      case DioExceptionType.unknown:
        if (dioError.message != null && dioError.message!.contains('SocketException')) {
          errorMessage = Languages.noNetwork;
          break;
        }
        errorMessage = Languages.somethingWentWrong;
        break;
      default:
        errorMessage = Languages.somethingWentWrong;
        break;
    }
    return Error<T>(errorMessage, dioError.type);
  }

  String _handleStatusCode(Response? response) {
    if(response != null){
      return response.data["status_message"];
    }
    return Languages.somethingWentWrong;
  }

  @override
  String toString() => errorMessage;
}
