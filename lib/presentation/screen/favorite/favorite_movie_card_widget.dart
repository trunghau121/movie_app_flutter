import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/common/screenutil/screenutil.dart';
import 'package:movie_app_flutter/common/utils/navigation_util.dart';
import 'package:movie_app_flutter/data/remote/endpoints.dart';
import '../../../common/constants/size_constants.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../bloc/favorite/favorite_cubit.dart';

class FavoriteMovieCardWidget extends StatelessWidget {
  final MovieEntity movie;

  const FavoriteMovieCardWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(Sizes.dimen_8),
      decoration: BoxDecoration(
        boxShadow: const [BoxShadow(color: Colors.grey, spreadRadius: 2)],
        borderRadius: BorderRadius.circular(Sizes.dimen_8),
      ),
      child: GestureDetector(
        onTap: () {
          NavigationUtil.gotoDetail(context, movie.id);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.dimen_8),
          child: Stack(
            children: <Widget>[
              Image.network(
                '${Endpoints.baseUrlImage}${movie.posterPath}',
                fit: BoxFit.cover,
                width: ScreenUtil.screenWidth / 2 - Sizes.dimen_16,
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () =>
                      context.read<FavoriteCubit>().deleteMovie(movie.id),
                  child: const Padding(
                    padding: EdgeInsets.all(Sizes.dimen_8),
                    child: Icon(
                      Icons.delete,
                      size: Sizes.dimen_26,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
