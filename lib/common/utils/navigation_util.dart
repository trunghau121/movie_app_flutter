import 'package:flutter/material.dart';
import 'package:movie_app_flutter/presentation/screen/favorite/favorite_screen.dart';
import 'package:movie_app_flutter/presentation/screen/movie_detail/movie_detail_arguments.dart';
import 'package:movie_app_flutter/presentation/screen/movie_detail/movie_detail_screen.dart';
import 'package:movie_app_flutter/presentation/screen/search_movie/search_movie_screen.dart';
import 'package:movie_app_flutter/presentation/screen/watch_videos/watch_videos_arguments.dart';
import 'package:movie_app_flutter/presentation/screen/watch_videos/watch_videos_screen.dart';
import '../../domain/entities/video_entity.dart';

class NavigationUtil {
  static void gotoDetail(BuildContext context, int movieId) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => MovieDetailScreen(
              movieDetailArguments: MovieDetailArguments(movieId: movieId))),
    );
  }

  static void gotoWatchVideos(BuildContext context, List<VideoEntity> videos) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) =>
              WatchVideosScreen(WatchVideosArguments(videos))),
    );
  }

  static void gotoSearchMovie(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SearchMovieScreen(),
      ),
    );
  }

  static void gotoFavorite(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const FavoriteScreen(),
      ),
    );
  }
}
