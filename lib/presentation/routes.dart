import 'package:flutter/cupertino.dart';
import 'package:movie_app_flutter/common/constants/route_constant.dart';
import 'package:movie_app_flutter/presentation/screen/favorite/favorite_screen.dart';
import 'package:movie_app_flutter/presentation/screen/home/home_screen.dart';
import 'package:movie_app_flutter/presentation/screen/movie_detail/movie_detail_arguments.dart';
import 'package:movie_app_flutter/presentation/screen/movie_detail/movie_detail_screen.dart';
import 'package:movie_app_flutter/presentation/screen/search_movie/search_movie_screen.dart';
import 'package:movie_app_flutter/presentation/screen/watch_videos/watch_videos_arguments.dart';
import 'package:movie_app_flutter/presentation/screen/watch_videos/watch_videos_screen.dart';

class Routes{
  static Map<String, WidgetBuilder> getRoutes(RouteSettings settings) => {
    RouteList.initial: (context) => const HomeScreen(),
    RouteList.favorite: (context) => const FavoriteScreen(),
    RouteList.searchMovie: (context) => const SearchMovieScreen(),
    RouteList.movieDetail: (context) => MovieDetailScreen(movieDetailArguments: settings.arguments as MovieDetailArguments),
    RouteList.watchTrailer: (context) => WatchVideosScreen(settings.arguments as WatchVideosArguments),
  };
}