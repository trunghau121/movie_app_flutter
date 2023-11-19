import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/common/extensions/size_extensions.dart';
import 'package:movie_app_flutter/presentation/bloc/movie_backdrop/movie_backdrop_cubit.dart';
import 'package:movie_app_flutter/presentation/screen/home/movie_carousel/animation_movie_card_widget.dart';
import '../../../../common/constants/size_constants.dart';
import '../../../../common/screenutil/screenutil.dart';
import '../../../../domain/entities/movie_entity.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;
  final int initPage;

  const MoviePageView(
      {super.key, required this.movies, required this.initPage});

  @override
  State<MoviePageView> createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: widget.initPage,
      keepPage: false,
      viewportFraction: 0.7,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Sizes.dimen_16.h, bottom: Sizes.dimen_4.h),
      height: ScreenUtil.screenHeight * 0.35,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          var item = widget.movies[index];
          return AnimationMovieCardWidget(
            index: index,
            movieId: item.id,
            posterPath: item.posterPath,
            pageController: _pageController,
          );
        },
        pageSnapping: true,
        itemCount: widget.movies.length,
        onPageChanged: (index) {
          context
              .read<MovieBackdropCubit>()
              .backdropChanged(widget.movies[index]);
        },
      ),
    );
  }
}
