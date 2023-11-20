import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/constants/size_constants.dart';
import 'package:movie_app_flutter/data/remote/endpoints.dart';

import '../../../../common/utils/navigation_util.dart';

class MovieCardWidget extends StatelessWidget {
  final int movieId;
  final String posterPath;

  const MovieCardWidget(
      {super.key, required this.movieId, required this.posterPath});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(Sizes.dimen_16),
      child: GestureDetector(
        onTap: () => {
          NavigationUtil.gotoDetail(context, movieId)
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.dimen_16),
          child: Image.network("${Endpoints.baseUrlImage}$posterPath", fit: BoxFit.cover,),
        ),
      ),
    );
  }
}
