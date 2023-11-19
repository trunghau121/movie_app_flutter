import 'package:flutter/material.dart';
import 'package:movie_app_flutter/domain/entities/movie_entity.dart';
import 'package:movie_app_flutter/presentation/screen/home/movie_carousel/movie_backdrop_widget.dart';
import 'package:movie_app_flutter/presentation/widgets/appbar_widget.dart';
import 'movie_page_view.dart';
import 'movie_title_carousel_widget.dart';

class MovieCarouselWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselWidget(
      {super.key, required this.movies, required this.defaultIndex});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      fit: StackFit.expand,
      children: [
        const MovieBackdropWidget(),
        Column(
          children: [
            const AppbarWidget(),
            MoviePageView(movies: movies, initPage: defaultIndex),
            const MovieTitleCarouselWidget(),
          ],
        ),
      ],
    );
  }
}
