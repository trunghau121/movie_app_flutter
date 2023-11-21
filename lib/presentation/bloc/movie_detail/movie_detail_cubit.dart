import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/domain/entities/movie_detail_params.dart';
import 'package:movie_app_flutter/presentation/bloc/movie_detail/movie_detail_state.dart';
import '../../../domain/usecases/get_movie_detail.dart';
import '../cast_crew/cast_crew_cubit.dart';

class MovieDetailCubit extends Cubit<MovieDetailState>{
  final GetMovieDetail getMovieDetail;
  final CastCrewCubit castCrewCubit;
  MovieDetailCubit(this.getMovieDetail, this.castCrewCubit): super(MovieDetailInit());

  Future<void> loadMovieDetail(int movieId) async{
    emit(MovieDetailLoading());
    (await getMovieDetail(MovieDetailParams(movieId: movieId))).when(
      success: (data) => {
        emit(MovieDetailLoaded(data!))
      },
      error: (message, type) => {
        emit(MovieDetailError(messageError: message, type: type))
      },
    );
    castCrewCubit.loadCastCrew(movieId);
  }

}