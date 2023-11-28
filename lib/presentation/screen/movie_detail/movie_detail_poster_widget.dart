import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/constants/size_constants.dart';
import 'package:movie_app_flutter/common/screenutil/screenutil.dart';
import 'package:movie_app_flutter/domain/entities/movie_detail_entity.dart';
import 'package:movie_app_flutter/theme/theme.dart';
import '../../../common/constants/endpoints.dart';
import 'review_button_widget.dart';
import 'watch_videos_button.dart';

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
          child: CachedNetworkImage(
              imageUrl:
                  "${Endpoints.urlOriginalImage}${movieDetailEntity.backdropPath}",
              fit: BoxFit.cover,
              width: ScreenUtil.screenWidth,
              height: ScreenUtil.screenHeight / 2,
              errorWidget: (context, exception, object) {
                return const SizedBox.shrink();
              }),
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
              child: CachedNetworkImage(
                imageUrl:
                    "${Endpoints.baseUrlImage}${movieDetailEntity.posterPath}",
                fit: BoxFit.cover,
                errorWidget: (context, exception, object) {
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        ),
        Positioned(
          left: ScreenUtil.screenWidth -
              (ScreenUtil.screenWidth - getHeightChild() - Sizes.dimen_16) +
              Sizes.dimen_10,
          right: Sizes.dimen_10,
          top: (ScreenUtil.screenHeight / 2) + Sizes.dimen_10,
          child: Text(
            movieDetailEntity.title,
            style: PrimaryFont.medium(Sizes.dimen_20)
                .copyWith(color: Colors.white),
          ),
        ),
        Positioned(
          right: Sizes.dimen_10,
          bottom: Sizes.dimen_10,
          child: ReviewButtonWidget(movieDetailEntity.voteAverage.toString()),
        ),
        Positioned(
          left: (ScreenUtil.screenWidth / 2) - Sizes.dimen_32,
          top: ((ScreenUtil.screenHeight / 2) / 2) - Sizes.dimen_32,
          child: const WatchVideosButton(),
        ),
      ],
    );
  }

  double getHeightChild() {
    return (ScreenUtil.screenWidth / 3.5);
  }
}
