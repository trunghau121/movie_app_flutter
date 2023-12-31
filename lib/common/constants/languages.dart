import 'package:movie_app_flutter/domain/entities/language_entity.dart';

class Languages {
  const Languages._();
  static const languages = [
    LanguageEntity(code: "vi", value: "Vietnamese"),
    LanguageEntity(code: "en", value: "English"),
  ];

  static const String favoriteMovies = 'favoriteMovies';
  static const String language = 'language';
  static const String feedback = 'feedback';
  static const String retry = 'retry';
  static const String about = 'about';
  static const String okay = 'okay';
  static const String aboutDescription = 'aboutDescription';
  static const String popular = 'popular';
  static const String now = 'now';
  static const String soon = 'soon';
  static const String noMovies = 'noMovies';
  static const String cast = 'cast';
  static const String watchTrailers = 'watchTrailers';
  static const String noMoviesSearched = 'noMoviesSearched';
  static const String noFavoriteMovie = 'noFavoriteMovie';
  static const String username = 'username';
  static const String password = 'password';
  static const String loginToMovieApp = 'loginToMovieApp';
  static const String signIn = 'signIn';
  static const String wrongUsernamePassword = 'wrongUsernamePassword';
  static const String logout = 'logout';
  static const String sessionDenied = 'sessionDenied';
  static const String enterTMDbUsername = 'enterTMDbUsername';
  static const String enterPassword = 'enterPassword';
  static const String guestSignIn = 'guestSignIn';
  static const String minutes = 'minutes';
  static const String showmore = 'showmore';
  static const String showless = 'showless';
  static const String enterSearch = 'enterSearch';
  // Error in App
  static const String somethingWentWrong = 'somethingWentWrong';
  static const String noNetwork = 'noNetwork';
  static const String lowConnectNetwork = 'lowConnectNetwork';
}
