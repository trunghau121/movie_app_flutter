import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/common/constants/size_constants.dart';
import 'package:movie_app_flutter/common/screenutil/screenutil.dart';
import 'package:movie_app_flutter/data/remote/endpoints.dart';
import 'package:movie_app_flutter/domain/entities/movie_entity.dart';
import 'package:movie_app_flutter/presentation/bloc/movie_backdrop/movie_backdrop_cubit.dart';

class MovieBackdropWidget extends StatelessWidget {
  const MovieBackdropWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.topCenter,
      heightFactor: 0.7,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(Sizes.dimen_40),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 1,
              child: BlocBuilder<MovieBackdropCubit, MovieEntity?>(
                builder: (BuildContext context, MovieEntity? state) {
                  return Image.network(
                    "${Endpoints.baseUrlImage}${state?.backdropPath}",
                    fit: BoxFit.fitHeight,
                  );
                },
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                width: ScreenUtil.screenWidth,
                height: 1,
                color: Colors.black.withAlpha(30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
