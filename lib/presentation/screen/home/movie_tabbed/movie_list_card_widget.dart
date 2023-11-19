import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/extensions/size_extensions.dart';
import 'package:movie_app_flutter/domain/entities/movie_entity.dart';
import 'package:movie_app_flutter/presentation/screen/home/movie_tabbed/movie_tab_card_widget.dart';
import '../../../../common/constants/size_constants.dart';

class MovieListCardWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  const MovieListCardWidget({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Sizes.dimen_6.h),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(
            width: Sizes.dimen_14.w,
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
