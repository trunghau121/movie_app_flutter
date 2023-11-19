import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/domain/entities/no_params.dart';
import 'package:movie_app_flutter/domain/usecases/get_coming_soon.dart';
import 'package:movie_app_flutter/domain/usecases/get_popular.dart';
import 'package:movie_app_flutter/presentation/bloc/movie_tabbed/movie_tabbed_state.dart';
import '../../../domain/usecases/get_playing_now.dart';
import '../loading/loading_cubit.dart';

class MovieTabbedCubit extends Cubit<MovieTabbedState> {
  final GetPopular getPopular;
  final GetPlayingNow getPlayingNow;
  final GetComingSoon getComingSoon;
  final LoadingCubit loadingCubit;

  MovieTabbedCubit({
    required this.getPopular,
    required this.getPlayingNow,
    required this.getComingSoon,
    required this.loadingCubit,
  }) : super(MovieTabbedInitial());

  Future<void> loadMovieTabbed(int indexPage) async {
    emit(MovieTabbedLoading());
    errorFunction(message, type) {}
    successFunction(data) {
      var movies = data!.results!;
      emit(MovieTabbedLoaded(movies: movies));
    }

    if (indexPage == 0) {
      (await getPopular(NoParams())).when(
        success: successFunction,
        error: errorFunction,
      );
    } else if (indexPage == 1) {
      (await getPlayingNow(NoParams())).when(
        success: successFunction,
        error: errorFunction,
      );
    } else if (indexPage == 2) {
      (await getComingSoon(NoParams())).when(
        success: successFunction,
        error: errorFunction,
      );
    }
  }
}
