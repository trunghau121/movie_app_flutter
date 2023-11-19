import 'package:get_it/get_it.dart';
import 'package:movie_app_flutter/data/data_sources/language_local_data_source.dart';
import 'package:movie_app_flutter/data/data_sources/movie_remote_data_resource.dart';
import 'package:movie_app_flutter/data/remote/remote_client.dart';
import 'package:movie_app_flutter/data/repositories/app_repository_impl.dart';
import 'package:movie_app_flutter/data/repositories/movie_repository_impl.dart';
import 'package:movie_app_flutter/domain/repositories/app_repository.dart';
import 'package:movie_app_flutter/domain/repositories/movie_repository.dart';
import 'package:movie_app_flutter/domain/usecases/get_coming_soon.dart';
import 'package:movie_app_flutter/domain/usecases/get_language.dart';
import 'package:movie_app_flutter/domain/usecases/get_playing_now.dart';
import 'package:movie_app_flutter/domain/usecases/get_popular.dart';
import 'package:movie_app_flutter/domain/usecases/get_trending.dart';
import 'package:movie_app_flutter/domain/usecases/movie_search.dart';
import 'package:movie_app_flutter/domain/usecases/update_language.dart';
import 'package:movie_app_flutter/presentation/bloc/language/language_cubit.dart';
import 'package:movie_app_flutter/presentation/bloc/loading/loading_cubit.dart';
import 'package:movie_app_flutter/presentation/bloc/movie_backdrop/movie_backdrop_cubit.dart';
import 'package:movie_app_flutter/presentation/bloc/movie_carousel/movie_carousel_cubit.dart';

import '../presentation/bloc/movie_tabbed/movie_tabbed_cubit.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<RemoteClient>(() => RemoteClient());
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(getItInstance()),
  );
  getItInstance.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(getItInstance()),
  );
  getItInstance.registerLazySingleton<LanguageLocalDataSource>(
    () => LanguageLocalDataSourceImpl(),
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
  getItInstance
      .registerLazySingleton(() => GetLanguage(appRepository: getItInstance()));
  getItInstance.registerLazySingleton(
      () => UpdateLanguage(appRepository: getItInstance()));

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
}
