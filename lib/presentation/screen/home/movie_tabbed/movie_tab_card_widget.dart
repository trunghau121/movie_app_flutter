import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/constants/size_constants.dart';
import 'package:movie_app_flutter/common/extensions/size_extensions.dart';
import 'package:movie_app_flutter/common/screenutil/screenutil.dart';
import 'package:movie_app_flutter/common/utils/extensions.dart';
import 'package:movie_app_flutter/domain/entities/movie_entity.dart';
import 'package:movie_app_flutter/theme/theme.dart';
import '../../../../data/remote/endpoints.dart';

class MovieTabCardWidget extends StatelessWidget {
  final MovieEntity movie;

  const MovieTabCardWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: SizedBox(
        width: ScreenUtil.screenWidth / 2.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_12.w)),
                child: Image.network(
                  "${Endpoints.baseUrlImage}${movie.posterPath}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(Sizes.dimen_10.w),
              child: Text(
                movie.title.intelliTrim(15),
                style: PrimaryFont.semiBold(Sizes.dimen_14.sp).copyWith(color: Colors.white),
                maxLines: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
