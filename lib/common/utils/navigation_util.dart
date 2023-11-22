import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/constants/route_constant.dart';
import 'package:movie_app_flutter/presentation/screen/movie_detail/movie_detail_arguments.dart';
import 'package:movie_app_flutter/presentation/screen/watch_videos/watch_videos_arguments.dart';
import '../../domain/entities/video_entity.dart';

class NavigationUtil {
  static void gotoDetail(BuildContext context, int movieId) {
    Navigator.of(context).pushNamed(
      RouteList.movieDetail,
      arguments: MovieDetailArguments(movieId: movieId),
    );
  }

  static void gotoWatchVideos(BuildContext context, List<VideoEntity> videos) {
    Navigator.of(context).pushNamed(
      RouteList.watchTrailer,
      arguments: WatchVideosArguments(videos),
    );
  }

  static void gotoSearchMovie(BuildContext context) {
    Navigator.of(context).pushNamed(RouteList.searchMovie);
  }

  static void gotoFavorite(BuildContext context) {
    Navigator.of(context).pushNamed(RouteList.favorite);
  }
}
