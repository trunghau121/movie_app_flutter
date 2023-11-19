import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/common/constants/languages.dart';
import 'package:movie_app_flutter/common/utils/extensions.dart';
import 'package:movie_app_flutter/presentation/bloc/movie_tabbed/movie_tabbed_cubit.dart';
import 'package:movie_app_flutter/presentation/bloc/movie_tabbed/movie_tabbed_state.dart';
import 'package:movie_app_flutter/presentation/screen/home/movie_tabbed/movie_list_card_widget.dart';
import 'package:movie_app_flutter/presentation/widgets/app_error_widget.dart';
import 'package:movie_app_flutter/theme/theme.dart';
import '../../../../common/constants/size_constants.dart';
import '../../loading/loading_circle.dart';

class MovieTabbedWidget extends StatefulWidget {
  const MovieTabbedWidget({super.key});

  @override
  State<MovieTabbedWidget> createState() => _MovieTabbedWidgetState();
}

class _MovieTabbedWidgetState extends State<MovieTabbedWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          isScrollable: true,
          indicatorWeight: 3.0,
          tabs: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Sizes.dimen_8),
              child: Text(Languages.popular.translator(context),
                  style: PrimaryFont.medium(Sizes.dimen_16)
                      .copyWith(color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Sizes.dimen_8),
              child: Text(Languages.now.translator(context),
                  style: PrimaryFont.medium(Sizes.dimen_16)
                      .copyWith(color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Sizes.dimen_8),
              child: Text(Languages.soon.translator(context),
                  style: PrimaryFont.medium(Sizes.dimen_16)
                      .copyWith(color: Colors.white)),
            )
          ],
          controller: _tabController,
          indicatorColor: kColorRoyalBlue,
          indicatorSize: TabBarIndicatorSize.tab,
          onTap: (index) =>
              {context.read<MovieTabbedCubit>().loadMovieTabbed(index)},
        ),
        BlocBuilder<MovieTabbedCubit, MovieTabbedState>(
          builder: (BuildContext context, MovieTabbedState state) {
            if (state is MovieTabbedLoaded) {
              return Expanded(child: MovieListCardWidget(movies: state.movies));
            } else if (state is MovieTabbedError) {
              return Expanded(
                child: AppErrorWidget(
                  contentError: state.contentError,
                  exceptionType: state.exceptionType,
                  onPressed: () => {},
                ),
              );
            } else {
              return const Expanded(
                child: Center(
                  child: LoadingCircle(
                    size: Sizes.dimen_230,
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
