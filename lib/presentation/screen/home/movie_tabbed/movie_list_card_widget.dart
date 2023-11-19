import 'package:flutter/material.dart';
import 'package:movie_app_flutter/domain/entities/movie_entity.dart';
import 'package:movie_app_flutter/presentation/screen/home/movie_tabbed/movie_tab_card_widget.dart';
import '../../../../common/constants/size_constants.dart';

class MovieListCardWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  const MovieListCardWidget({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Sizes.dimen_20, bottom: Sizes.dimen_10),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: Sizes.dimen_14,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          var movie = movies[index];
          return MovieTabCardWidget(movie: movie);
        },
        itemCount: movies.length,
      ),
    );
  }
}
