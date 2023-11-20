import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/constants/size_constants.dart';
import 'package:movie_app_flutter/common/screenutil/screenutil.dart';
import 'package:movie_app_flutter/domain/entities/movie_detail_entity.dart';
import 'package:movie_app_flutter/theme/theme.dart';
import '../../../data/remote/endpoints.dart';

class MovieDetailPosterWidget extends StatelessWidget {
  final MovieDetailEntity movieDetailEntity;

  const MovieDetailPosterWidget(this.movieDetailEntity, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(Sizes.dimen_16),
              bottomRight: Radius.circular(Sizes.dimen_16)),
          child: Image.network(
            "${Endpoints.baseUrlImage}${movieDetailEntity.backdropPath}",
            fit: BoxFit.cover,
            width: ScreenUtil.screenWidth,
            height: ScreenUtil.screenHeight / 2.7,
          ),
        ),
        Positioned(
          left: Sizes.dimen_16,
          right: ScreenUtil.screenWidth - getHeightChild() - Sizes.dimen_16,
          bottom: -(getHeightChild() * 1.5) / 2,
          child: Container(
            padding: const EdgeInsets.all(Sizes.dimen_1),
            decoration: const BoxDecoration(
              color: kColorViolet,
              borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_16)),
            ),
            width: getHeightChild(),
            height: getHeightChild() * 1.5,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(Sizes.dimen_16),
              ),
              child: Image.network(
                "${Endpoints.baseUrlImage}${movieDetailEntity.posterPath}",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          left: ScreenUtil.screenWidth - (ScreenUtil.screenWidth -
              getHeightChild() -
              Sizes.dimen_16) + Sizes.dimen_10,
          right: Sizes.dimen_10,
          top: (ScreenUtil.screenHeight / 2.7) + Sizes.dimen_10,
          child: Text(
            movieDetailEntity.title,
            style: PrimaryFont.medium(Sizes.dimen_20)
                .copyWith(color: Colors.white),
          ),
        ),
        Positioned(
          right: Sizes.dimen_10,
          bottom: Sizes.dimen_10,
          child: Container(
            padding: const EdgeInsets.symmetric(
                vertical: Sizes.dimen_4, horizontal: Sizes.dimen_10),
            decoration: const BoxDecoration(
              color: kColorViolet,
              borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_16)),
            ),
            child: Row(
              children: [
                const Icon(Icons.star,
                    size: Sizes.dimen_18, color: Colors.white),
                const SizedBox(width: Sizes.dimen_4),
                Text(
                  movieDetailEntity.voteAverage.toString(),
                  style: PrimaryFont.medium(Sizes.dimen_14)
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
  
  double getHeightChild(){
    return (ScreenUtil.screenWidth / 3.5);
  }
}
