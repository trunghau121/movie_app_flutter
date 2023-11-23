import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/presentation/bloc/search_movie/search_movie_state.dart';
import '../../../domain/entities/movie_search_params.dart';
import '../../../domain/usecases/movie_search.dart';

class SearchMovieCubit extends Cubit<SearchMovieState>{
  final SearchMovies searchMovies;
  SearchMovieCubit(this.searchMovies) : super(SearchMovieInit());

  Future<void> getSearchMovies(String searchTerm) async{
    if (searchTerm.trim().isNotEmpty) {
      emit(SearchMovieLoading());
      (await searchMovies(MovieSearchParams(searchTerm: searchTerm.trim()))).when(
          success: (data) =>
          {
            emit(SearchMovieLoaded(data!.data))
          },
          error: (message, type) =>
          {
            emit(SearchMovieError(message, type))
          }
      );
    }else {
      emit(SearchMovieInit());
    }
  }

  void clearSearch(){
    emit(SearchMovieInit());
  }
}