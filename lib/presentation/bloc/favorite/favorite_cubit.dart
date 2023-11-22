import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../../domain/entities/movie_params.dart';
import '../../../domain/entities/no_params.dart';
import '../../../domain/usecases/check_if_movie_favorite.dart';
import '../../../domain/usecases/delete_favorite_movie.dart';
import '../../../domain/usecases/get_favorite_movies.dart';
import '../../../domain/usecases/save_movie.dart';
part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final SaveMovie saveMovie;
  final GetFavoriteMovies getFavoriteMovies;
  final DeleteFavoriteMovie deleteFavoriteMovie;
  final CheckIfFavoriteMovie checkIfFavoriteMovie;

  FavoriteCubit({
    required this.saveMovie,
    required this.getFavoriteMovies,
    required this.deleteFavoriteMovie,
    required this.checkIfFavoriteMovie,
  }) : super(FavoriteInitial());

  void toggleFavoriteMovie(MovieEntity movieEntity, bool isFavorite) async {
    if (isFavorite) {
      await deleteFavoriteMovie(MovieParams(movieEntity.id));
    } else {
      await saveMovie(movieEntity);
    }

    final response = await checkIfFavoriteMovie(MovieParams(movieEntity.id));
    response.when(
      success: (data) => {
        emit(IsFavoriteMovie(data!))
      },
      error: (message, type) => {
        emit(FavoriteMoviesError())
      }
    );
  }

  void loadFavoriteMovie() async {
    var response = await getFavoriteMovies(NoParams());
    response.when(
        success: (data) => {
          emit(FavoriteMoviesLoaded(data!))
        },
        error: (message, type) => {
          emit(FavoriteMoviesError())
        }
    );
  }

  void deleteMovie(int movieId) async {
    await deleteFavoriteMovie(MovieParams(movieId));
    loadFavoriteMovie();
  }

  void checkIfMovieFavorite(int movieId) async {
    final response = await checkIfFavoriteMovie(MovieParams(movieId));
    response.when(
        success: (data) => {
          emit(IsFavoriteMovie(data!))
        },
        error: (message, type) => {
          emit(FavoriteMoviesError())
        }
    );
  }
}
