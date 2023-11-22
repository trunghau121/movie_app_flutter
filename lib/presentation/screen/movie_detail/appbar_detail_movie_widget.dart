import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/common/constants/size_constants.dart';
import 'package:movie_app_flutter/theme/theme.dart';

import '../../../domain/entities/movie_detail_entity.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../bloc/favorite/favorite_cubit.dart';

class AppbarDetailMovieWidget extends StatelessWidget {
  final MovieDetailEntity movieDetailEntity;

  const AppbarDetailMovieWidget(this.movieDetailEntity, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: Sizes.dimen_26,
        ),
      ),
      actions: [
        BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            if (state is IsFavoriteMovie) {
              return GestureDetector(
                onTap: () => BlocProvider.of<FavoriteCubit>(context)
                    .toggleFavoriteMovie(
                  MovieEntity.fromMovieDetailEntity(movieDetailEntity),
                  state.isMovieFavorite,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: Sizes.dimen_16),
                  child: Icon(
                    state.isMovieFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: state.isMovieFavorite ? kColorViolet : Colors.white,
                    size: Sizes.dimen_26,
                  ),
                ),
              );
            } else {
              return const Padding(
                padding: EdgeInsets.only(right: Sizes.dimen_16),
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                  size: Sizes.dimen_26,
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
