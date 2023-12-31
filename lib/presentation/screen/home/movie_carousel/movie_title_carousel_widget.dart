import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/common/constants/size_constants.dart';
import 'package:movie_app_flutter/domain/entities/movie_entity.dart';
import 'package:movie_app_flutter/presentation/bloc/movie_backdrop/movie_backdrop_cubit.dart';
import 'package:movie_app_flutter/theme/theme.dart';

class MovieTitleCarouselWidget extends StatelessWidget {
  const MovieTitleCarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBackdropCubit, MovieEntity?>(
      builder: (BuildContext context, MovieEntity? state) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: Sizes.dimen_12, left: Sizes.dimen_20, right: Sizes.dimen_20),
          child: Text(
            state!.title,
            style: PrimaryFont.semiBold(Sizes.dimen_18)
                .copyWith(color: Colors.white),
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        );
      },
    );
  }
}
