import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/presentation/screen/search_movie/search_appbar.dart';
import 'package:movie_app_flutter/presentation/screen/search_movie/search_movie_card.dart';
import '../../../common/constants/size_constants.dart';
import '../../../di/get_it.dart';
import '../../bloc/search_movie/search_movie_cubit.dart';
import '../../bloc/search_movie/search_movie_state.dart';
import '../../widgets/app_error_widget.dart';
import '../loading/loading_circle.dart';

class SearchMovieScreen extends StatefulWidget {
  const SearchMovieScreen({super.key});

  @override
  State<SearchMovieScreen> createState() => _SearchMovieWidgetState();
}

class _SearchMovieWidgetState extends State<SearchMovieScreen> {
  late SearchMovieCubit _searchMovieCubit;

  @override
  void initState() {
    _searchMovieCubit = getItInstance<SearchMovieCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _searchMovieCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _searchMovieCubit,
      child: Scaffold(
        body: Column(
          children: [
            const SearchAppbar(),
            Expanded(
              child: BlocBuilder<SearchMovieCubit, SearchMovieState>(
                builder: (BuildContext context, SearchMovieState state) {
                  if (state is SearchMovieLoaded && state.movieEntities.isNotEmpty) {
                    return ListView.builder(
                      itemCount: state.movieEntities.length,
                      itemBuilder: (context, index) {
                        return SearchMovieCard(state.movieEntities[index]);
                      },
                    );
                  } else if (state is SearchMovieLoading) {
                    return const Center(child: LoadingCircle(size: Sizes.dimen_100));
                  } else if (state is SearchMovieError) {
                    return Center(
                      child: AppErrorWidget(
                        contentError: state.message,
                        exceptionType: state.type,
                        onPressed: () => {},
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
