import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/utils/navigation_util.dart';
import 'package:movie_app_flutter/domain/entities/movie_entity.dart';
import '../../../common/constants/size_constants.dart';
import '../../../data/remote/endpoints.dart';
import '../../../theme/theme.dart';

class SearchMovieCard extends StatelessWidget {
  final MovieEntity movieEntity;

  const SearchMovieCard(this.movieEntity, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        NavigationUtil.gotoDetail(context, movieEntity.id)
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.dimen_16,
          vertical: Sizes.dimen_2,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(Sizes.dimen_8),
              child: SizedBox(
                width: Sizes.dimen_100,
                height: Sizes.dimen_100,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(Sizes.dimen_12)),
                  child: CachedNetworkImage(
                    imageUrl: "${Endpoints.baseUrlImage}${movieEntity.posterPath}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: Sizes.dimen_12),
                  Text(
                    movieEntity.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: PrimaryFont.medium(Sizes.dimen_18)
                        .copyWith(color: Colors.white),
                  ),
                  Text(
                    movieEntity.overview ?? "",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: PrimaryFont.medium(Sizes.dimen_16)
                        .copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
