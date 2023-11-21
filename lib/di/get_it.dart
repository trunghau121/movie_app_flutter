import 'package:get_it/get_it.dart';
import 'package:movie_app_flutter/data/data_sources/app_local_data_source.dart';
import 'package:movie_app_flutter/data/data_sources/movie_remote_data_resource.dart';
import 'package:movie_app_flutter/data/remote/remote_client.dart';
import 'package:movie_app_flutter/data/repositories/app_repository_impl.dart';
import 'package:movie_app_flutter/data/repositories/movie_repository_impl.dart';
import 'package:movie_app_flutter/domain/repositories/app_repository.dart';
import 'package:movie_app_flutter/domain/repositories/movie_repository.dart';
import 'package:movie_app_flutter/domain/usecases/get_cast_crew.dart';
import 'package:movie_app_flutter/domain/usecases/get_coming_soon.dart';
import 'package:movie_app_flutter/domain/usecases/get_language.dart';
import 'package:movie_app_flutter/domain/usecases/get_movie_detail.dart';
import 'package:movie_app_flutter/domain/usecases/get_playing_now.dart';
import 'package:movie_app_flutter/domain/usecases/get_popular.dart';
import 'package:movie_app_flutter/domain/usecases/get_theme.dart';
import 'package:movie_app_flutter/domain/usecases/get_trending.dart';
import 'package:movie_app_flutter/domain/usecases/movie_search.dart';
import 'package:movie_app_flutter/domain/usecases/update_language.dart';
import 'package:movie_app_flutter/domain/usecases/update_theme.dart';
import 'package:movie_app_flutter/presentation/bloc/language/language_cubit.dart';
import 'package:movie_app_flutter/presentation/bloc/loading/loading_cubit.dart';
import 'package:movie_app_flutter/presentation/bloc/movie_backdrop/movie_backdrop_cubit.dart';
import 'package:movie_app_flutter/presentation/bloc/movie_carousel/movie_carousel_cubit.dart';
import 'package:movie_app_flutter/presentation/bloc/movie_detail/movie_detail_cubit.dart';
import 'package:movie_app_flutter/presentation/bloc/theme/theme_cubit.dart';

import '../presentation/bloc/cast_crew/cast_crew_cubit.dart';
import '../presentation/bloc/movie_tabbed/movie_tabbed_cubit.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<RemoteClient>(() => RemoteClient());
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(getItInstance(), getItInstance()),
  );
  getItInstance.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(getItInstance()),
  );
  getItInstance.registerLazySingleton<AppLocalDataSource>(
    () => AppLocalDataSourceImpl(),
  );
  getItInstance.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(getItInstance()),
  );

  // Use Cases
  getItInstance.registerLazySingleton(() => GetComingSoon(getItInstance()));
  getItInstance.registerLazySingleton(() => GetPlayingNow(getItInstance()));
  getItInstance.registerLazySingleton(() => GetPopular(getItInstance()));
  getItInstance.registerLazySingleton(() => GetTrending(getItInstance()));
  getItInstance.registerLazySingleton(() => SearchMovies(getItInstance()));
  getItInstance.registerLazySingleton(() => GetLanguage(getItInstance()));
  getItInstance.registerLazySingleton(() => UpdateLanguage(getItInstance()));
  getItInstance.registerLazySingleton(() => GetMovieDetail(getItInstance()));
  getItInstance.registerLazySingleton(() => GetTheme(getItInstance()));
  getItInstance.registerLazySingleton(() => UpdateTheme(getItInstance()));
  getItInstance.registerLazySingleton(() => GetCastCrew(getItInstance()));

  // Bloc
  getItInstance.registerFactory(() => MovieBackdropCubit());
  getItInstance.registerSingleton<LoadingCubit>(LoadingCubit());
  getItInstance.registerFactory(() => MovieCarouselCubit(
        getTrending: getItInstance(),
        movieBackdropCubit: getItInstance(),
        loadingCubit: getItInstance(),
      ));

  getItInstance.registerFactory(() => MovieTabbedCubit(
        getPopular: getItInstance(),
        getPlayingNow: getItInstance(),
        getComingSoon: getItInstance(),
        loadingCubit: getItInstance(),
      ));

  getItInstance.registerFactory(() => LanguageCubit(
        getLanguage: getItInstance(),
        updateLanguage: getItInstance(),
      ));

  getItInstance.registerFactory(() => ThemeCubit(
    getTheme: getItInstance(),
    updateTheme: getItInstance(),
  ));

  getItInstance.registerFactory(() => CastCrewCubit(getItInstance()));
  getItInstance.registerFactory(() => MovieDetailCubit(getItInstance(), getItInstance()));
}
