class Endpoints {
  Endpoints._();
  static const apiUrl = String.fromEnvironment('API_URL');
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration connectionTimeout = Duration(seconds: 30);
}
