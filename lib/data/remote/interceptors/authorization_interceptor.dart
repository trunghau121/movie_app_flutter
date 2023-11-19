import 'package:dio/dio.dart';

const String apiKey = '2472f33b26e67da5bb1456ffa226d78a';

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