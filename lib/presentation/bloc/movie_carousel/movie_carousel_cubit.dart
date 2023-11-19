import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../../domain/entities/no_params.dart';
import '../../../domain/usecases/get_trending.dart';
import '../loading/loading_cubit.dart';
import '../movie_backdrop/movie_backdrop_cubit.dart';

part 'movie_carousel_state.dart';

class MovieCarouselCubit extends Cubit<MovieCarouselState> {
  final GetTrending getTrending;
  final MovieBackdropCubit movieBackdropCubit;
  final LoadingCubit loadingCubit;

  MovieCarouselCubit({
    required this.getTrending,
    required this.movieBackdropCubit,
    required this.loadingCubit,
  }) : super(MovieCarouselInitial());

  void loadCarousel({int defaultIndex = 0}) async {
    loadingCubit.show();
    (await getTrending(NoParams())).when(
      success: (data) async {
        var movies = data!.results!;
        movieBackdropCubit.backdropChanged(movies[defaultIndex]);
        return emit(
          MovieCarouselLoaded(
            movies: movies,
            defaultIndex: defaultIndex,
          ),
        );
      },
      error: (message, type) async {
        return emit(MovieCarouselError(message, type));
      },
    );
    loadingCubit.hide();
  }
}
