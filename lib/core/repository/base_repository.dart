import 'package:flutter/foundation.dart';

import '../remote/remote_client.dart';
import '../utils/remote_handel_error.dart';
import 'package:dio/dio.dart';
import '../common/result.dart';
import '../utils/network_info.dart';
import '../utils/typedefs.dart';

class BaseRepository {
  @protected final RemoteClient dioClient = RemoteClient.getInstance();
  final NetworkInfoImpl _networkInfo = NetworkInfoImpl();

  @protected
  Future<Result<Data>> getResultApi<Data>(
    Future<Response> Function() execute,
    Data? Function(JSON json) convert,
  ) async {
    try {
      if (await _networkInfo.isConnected) {
        var response = await execute();
        int status = response.data["status"];
        if (status == 1) {
          return Success(convert(response.data["data"]));
        } else {
          return Error(
            response.data["msg"],
            DioExceptionType.badResponse,
          );
        }
      } else {
        return Error(
          RemoteHandelError.defaultErrorInternet,
          DioExceptionType.unknown,
        );
      }
    } on DioException catch (exception) {
      return RemoteHandelError().fromRemoteError(exception);
    }
  }
}
