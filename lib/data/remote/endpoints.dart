class Endpoints {
  Endpoints._();
  static const apiUrl = "https://api.themoviedb.org/3/";
  static const baseUrlImage = "https://image.tmdb.org/t/p/w500";
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration connectionTimeout = Duration(seconds: 30);
}
