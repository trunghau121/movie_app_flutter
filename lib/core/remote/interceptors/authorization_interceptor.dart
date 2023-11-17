import 'package:dio/dio.dart';

const String apiKey = '';

class AuthorizationInterceptor extends Interceptor{

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if(_needAuthorizationHeader(options)){
      options.headers['Authorization'] = 'Bear $apiKey';
    }
    super.onRequest(options, handler);
  }

  bool _needAuthorizationHeader(RequestOptions options) {
    if (options.method == 'GET') {
      return false;
    } else {
      return true;
    }
  }
}