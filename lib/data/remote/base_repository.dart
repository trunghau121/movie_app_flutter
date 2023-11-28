import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import '../../common/constants/languages.dart';
import '../../common/utils/remote_handel_error.dart';
import 'package:dio/dio.dart';
import '../../common/result.dart';
import '../../common/utils/network_info.dart';
import '../../common/typedefs.dart';

class BaseRepository {
  final NetworkInfoImpl _networkInfo = NetworkInfoImpl();

  @protected
  Future<Result<Data>> getResultApi<Data>(
    Future<Response> Function() execute,
    Data? Function(JSON json) convert,
  ) async {
    try {
      if (await _networkInfo.isConnected) {
        var response = await execute();
        if (response.statusCode == 200) {
          return Success(convert(response.data));
        } else {
          return Error(
            response.data["status_message"],
            DioExceptionType.badResponse,
          );
        }
      } else {
        return Error(
          Languages.somethingWentWrong,
          DioExceptionType.unknown,
        );
      }
    } catch (exception) {
      Logger().e("Error: ${exception.toString()}");
      if(exception is DioException) {
        return RemoteHandelError().fromRemoteError(exception);
      }else {
        return Error<Data>(Languages.somethingWentWrong, DioExceptionType.unknown);
      }
    }
  }
}
