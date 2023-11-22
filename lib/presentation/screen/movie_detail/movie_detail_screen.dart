import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/di/get_it.dart';
import 'package:movie_app_flutter/presentation/bloc/cast_crew/cast_crew_cubit.dart';
import 'package:movie_app_flutter/presentation/bloc/movie_detail/movie_detail_cubit.dart';
import 'package:movie_app_flutter/presentation/bloc/movie_detail/movie_detail_state.dart';
import 'package:movie_app_flutter/presentation/bloc/video/video_cubit.dart';
import 'package:movie_app_flutter/presentation/screen/loading/loading_circle.dart';
import 'package:movie_app_flutter/presentation/screen/movie_detail/cast_crew/cast_crew_widget.dart';
import 'package:movie_app_flutter/presentation/screen/movie_detail/movie_detail_arguments.dart';
import 'package:movie_app_flutter/presentation/screen/movie_detail/movie_detail_poster_widget.dart';
import 'package:movie_app_flutter/presentation/widgets/app_error_widget.dart';
import '../../../common/constants/size_constants.dart';
import '../../../common/screenutil/screenutil.dart';
import 'appbar_detail_movie_widget.dart';
import 'movie_detail_content_widget.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieDetailArguments movieDetailArguments;

  const MovieDetailScreen({super.key, required this.movieDetailArguments});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late MovieDetailCubit _movieDetailCubit;
  late CastCrewCubit _castCrewCubit;
  late VideoCubit _videoCubit;

  @override
  void initState() {
    _movieDetailCubit = getItInstance<MovieDetailCubit>();
    _castCrewCubit = _movieDetailCubit.castCrewCubit;
    _videoCubit = _movieDetailCubit.videoCubit;
    _movieDetailCubit.loadMovieDetail(widget.movieDetailArguments.movieId);
    super.initState();
  }

  @override
  void dispose() {
    _movieDetailCubit.close();
    _castCrewCubit.close();
    _videoCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => _movieDetailCubit),
          BlocProvider(create: (context) => _castCrewCubit),
          BlocProvider(create: (context) => _videoCubit),
        ],
        child: BlocBuilder<MovieDetailCubit, MovieDetailState>(
          builder: (BuildContext context, MovieDetailState state) {
            if (state is MovieDetailLoaded) {
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        MovieDetailPosterWidget(state.movieDetail),
                        SizedBox(
                          height: (ScreenUtil.screenWidth / 3.5) / 2 +
                              Sizes.dimen_60,
                        ),
                        MovieDetailContentWidget(state.movieDetail),
                        const SizedBox(height: Sizes.dimen_10),
                        const CastCrewWidget(),
                      ],
                    ),
                  ),
                  SizedBox(
                      height: Sizes.dimen_80 + ScreenUtil.statusBarHeight,
                      child: const AppbarDetailMovieWidget()),
                ],
              );
            } else if (state is MovieDetailLoading) {
              return const Center(child: LoadingCircle(size: Sizes.dimen_100));
            } else if (state is MovieDetailError) {
              return AppErrorWidget(
                contentError: state.messageError,
                exceptionType: state.type,
                onPressed: () {
                  _movieDetailCubit
                      .loadMovieDetail(widget.movieDetailArguments.movieId);
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
