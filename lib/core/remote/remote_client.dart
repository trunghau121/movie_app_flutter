import 'package:dio/dio.dart';
import 'package:movie_app_flutter/core/utils/endpoints.dart';
import '../remote/interceptors/authorization_interceptor.dart';
import '../remote/interceptors/logger_interceptor.dart';
import '../utils/typedefs.dart';

class RemoteClient {
  static RemoteClient? instance;

  static RemoteClient getInstance() {
    instance ??= RemoteClient();
    return instance!;
  }

  RemoteClient()
      : _dio = Dio(
          BaseOptions(
            baseUrl: "https://api.azibai.com/api/v1/",
            connectTimeout: Endpoints.connectionTimeout,
            receiveTimeout: Endpoints.connectionTimeout,
            responseType: ResponseType.json,
          ),
        )..interceptors.addAll([
            AuthorizationInterceptor(),
            LoggerInterceptor(),
          ]);

  late final Dio _dio;
  final CancelToken _cancelToken = CancelToken();

  Future<Response> get(
    String url,
    QueryParams? params,
    CancelToken? cancelToken,
  ) async {
    Response response = await _dio.get(
      url,
      queryParameters: params,
      options: Options(responseType: ResponseType.json),
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response;
  }

  ///used for calling post Request
  Future<Response> post(
    String url,
    QueryParams? params,
    CancelToken? cancelToken,
  ) async {
    Response response = await _dio.post(
      url,
      data: params,
      options: Options(responseType: ResponseType.json),
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response;
  }

  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }
}
