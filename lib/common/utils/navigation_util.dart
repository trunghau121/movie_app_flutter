import 'package:flutter/material.dart';
import 'package:movie_app_flutter/presentation/screen/movie_detail/movie_detail_arguments.dart';
import 'package:movie_app_flutter/presentation/screen/movie_detail/movie_detail_screen.dart';

class NavigationUtil {
  static void gotoDetail(BuildContext context, int movieId) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => MovieDetailScreen(
              movieDetailArguments: MovieDetailArguments(movieId: movieId))),
    );
  }
}
