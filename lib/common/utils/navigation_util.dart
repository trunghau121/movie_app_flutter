import 'package:flutter/material.dart';
import 'package:movie_app_flutter/presentation/screen/movie_detail/movie_detail_arguments.dart';
import 'package:movie_app_flutter/presentation/screen/movie_detail/movie_detail_screen.dart';
import 'package:movie_app_flutter/presentation/screen/videos/videos_arguments.dart';
import 'package:movie_app_flutter/presentation/screen/videos/videos_screen.dart';
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
          builder: (context) => VideosScreen(
              VideosArguments(videos))),
    );
  }
}
