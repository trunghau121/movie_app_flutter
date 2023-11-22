import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/common/constants/languages.dart';
import 'package:movie_app_flutter/common/utils/extensions.dart';
import 'package:movie_app_flutter/theme/theme.dart';
import '../../../common/constants/size_constants.dart';
import '../../../di/get_it.dart';
import '../../bloc/favorite/favorite_cubit.dart';
import 'favorite_movie_grid_view.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late FavoriteCubit _favoriteBloc;

  @override
  void initState() {
    super.initState();
    _favoriteBloc = getItInstance<FavoriteCubit>();
    _favoriteBloc.loadFavoriteMovie();
  }

  @override
  void dispose() {
    _favoriteBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: Sizes.dimen_6,
        title: Text(
          Languages.favoriteMovies.translator(context),
        ),
      ),
      body: BlocProvider.value(
        value: _favoriteBloc,
        child: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            if (state is FavoriteMoviesLoaded) {
              if (state.movies.isEmpty) {
                return Center(
                  child: Text(
                    Languages.noFavoriteMovie.translator(context),
                    textAlign: TextAlign.center,
                    style: PrimaryFont.medium(Sizes.dimen_20).copyWith(color: Colors.white),
                  ),
                );
              }
              return FavoriteMovieGridView(
                movies: state.movies,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
