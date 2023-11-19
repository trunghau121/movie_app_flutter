import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/presentation/bloc/movie_tabbed/movie_tabbed_cubit.dart';
import 'package:movie_app_flutter/presentation/screen/drawer/navigation_drawer_widget.dart';
import 'package:movie_app_flutter/presentation/screen/home/movie_carousel/movie_carousel_widget.dart';
import 'package:movie_app_flutter/presentation/screen/home/movie_tabbed/movie_tabbed_widget.dart';
import 'package:movie_app_flutter/presentation/widgets/app_error_widget.dart';
import '../../../di/get_it.dart';
import '../../bloc/movie_backdrop/movie_backdrop_cubit.dart';
import '../../bloc/movie_carousel/movie_carousel_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieCarouselCubit _carouselCubit;
  late MovieBackdropCubit _movieBackdrop;
  late MovieTabbedCubit _movieTabbedCubit;

  @override
  void initState() {
    super.initState();
    _carouselCubit = getItInstance<MovieCarouselCubit>();
    _movieBackdrop = _carouselCubit.movieBackdropCubit;
    _carouselCubit.loadCarousel();
    _movieTabbedCubit = getItInstance<MovieTabbedCubit>();
    _movieTabbedCubit.loadMovieTabbed(0);
  }

  @override
  void dispose() {
    _carouselCubit.close();
    _movieBackdrop.close();
    _movieTabbedCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => _carouselCubit),
        BlocProvider(create: (context) => _movieBackdrop),
        BlocProvider(create: (context) => _movieTabbedCubit),
      ],
      child: Scaffold(
        drawer: const NavigationDrawerWidget(),
        body: BlocBuilder<MovieCarouselCubit, MovieCarouselState>(
          builder: (BuildContext context, MovieCarouselState state) {
            if (state is MovieCarouselLoaded) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  FractionallySizedBox(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.6,
                    child: MovieCarouselWidget(
                      movies: state.movies,
                      defaultIndex: state.defaultIndex,
                    ),
                  ),
                  const FractionallySizedBox(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 0.4,
                    child: MovieTabbedWidget(),
                  )
                ],
              );
            } else if (state is MovieCarouselError) {
              return AppErrorWidget(
                contentError: state.contentError,
                exceptionType: state.exceptionType,
                onPressed: () => {},
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
