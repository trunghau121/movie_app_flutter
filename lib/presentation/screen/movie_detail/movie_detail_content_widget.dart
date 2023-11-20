import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app_flutter/common/constants/icons_constant.dart';
import 'package:movie_app_flutter/common/constants/languages.dart';
import 'package:movie_app_flutter/common/utils/extensions.dart';
import '../../../common/constants/size_constants.dart';
import '../../../domain/entities/movie_detail_entity.dart';
import '../../../theme/theme.dart';

class MovieDetailContentWidget extends StatelessWidget {
  final MovieDetailEntity movieDetailEntity;
  const MovieDetailContentWidget(this.movieDetailEntity, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SvgPicture.asset(IconsConstant.date),
                const SizedBox(width: Sizes.dimen_4),
                Text(
                  movieDetailEntity.releaseDate,
                  style: PrimaryFont.medium(Sizes.dimen_14)
                      .copyWith(color: Colors.grey),
                )
              ],
            ),
            const SizedBox(width: Sizes.dimen_6),
            Container(
              width: 1,
              height: Sizes.dimen_18,
              color: Colors.grey,
            ),
            const SizedBox(width: Sizes.dimen_6),
            Row(
              children: [
                SvgPicture.asset(IconsConstant.time),
                const SizedBox(width: Sizes.dimen_4),
                Text(
                  "${movieDetailEntity.duration} ${Languages.minutes.translator(context)}",
                  style: PrimaryFont.medium(Sizes.dimen_14)
                      .copyWith(color: Colors.grey),
                )
              ],
            )
          ],
        ),
        const SizedBox(height: Sizes.dimen_10),
        Padding(
          padding: const EdgeInsets.all(Sizes.dimen_12),
          child: Text(
            movieDetailEntity.overview,
            style: PrimaryFont.medium(Sizes.dimen_16).copyWith(color: Colors.grey),
          ),
        )
      ],
    );
  }
}
