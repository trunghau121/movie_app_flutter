import 'package:dio/dio.dart';
import 'package:movie_app_flutter/data/remote/endpoints.dart';
import '../../common/typedefs.dart';
import '../remote/interceptors/authorization_interceptor.dart';
import '../remote/interceptors/logger_interceptor.dart';

class RemoteClient {
  RemoteClient()
      : _dio = Dio(
          BaseOptions(
            baseUrl: Endpoints.apiUrl,
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
    params?.putIfAbsent("api_key", () => apiKey);
    Response response = await _dio.get(
      url,
      queryParameters: params?? {}..putIfAbsent("api_key", () => apiKey),
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
