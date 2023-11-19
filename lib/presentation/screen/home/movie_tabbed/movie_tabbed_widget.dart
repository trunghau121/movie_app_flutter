import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/common/extensions/size_extensions.dart';
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
  final List<Widget> _tabs = [
    Tab(
      height: Sizes.dimen_10.h,
      child: Text("POPULAR", style: PrimaryFont.medium(Sizes.dimen_16.sp)),
    ),
    Tab(
        height: Sizes.dimen_10.h,
        child: Text("NOW", style: PrimaryFont.medium(Sizes.dimen_16.sp))),
    Tab(
        height: Sizes.dimen_10.h,
        child: Text("SOON", style: PrimaryFont.medium(Sizes.dimen_16.sp))),
  ];
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          isScrollable: true,
          indicatorWeight: 3.0,
          tabs: _tabs,
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
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
              return Expanded(
                child: Center(
                  child: LoadingCircle(
                    size: Sizes.dimen_100.w,
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
