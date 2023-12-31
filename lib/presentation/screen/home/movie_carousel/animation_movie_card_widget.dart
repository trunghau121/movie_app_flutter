import 'package:flutter/material.dart';
import '../../../../common/screenutil/screenutil.dart';
import 'movie_card_widget.dart';

class AnimationMovieCardWidget extends StatelessWidget {
  final int index;
  final int movieId;
  final String posterPath;
  final PageController pageController;

  const AnimationMovieCardWidget({
    Key? key,
    required this.index,
    required this.movieId,
    required this.posterPath,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = (pageController.page ?? 0) - index;
          value = (1 - (value.abs() * 0.1)).clamp(0.0, 1.0);
          return Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: Curves.easeIn.transform(value) *
                  ScreenUtil.screenHeight *
                  0.35,
              width: ScreenUtil.screenHeight / 4,
              child: child,
            ),
          );
        } else {
          return Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height:
              Curves.easeIn.transform(index == 0 ? value : value * 0.9) *
                  ScreenUtil.screenHeight *
                  0.35,
              width: ScreenUtil.screenHeight / 4,
              child: child,
            ),
          );
        }
      },
      child: MovieCardWidget(
        movieId: movieId,
        posterPath: posterPath,
      ),
    );
  }
}
