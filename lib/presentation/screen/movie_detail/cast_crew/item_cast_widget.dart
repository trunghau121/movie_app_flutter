import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/constants/size_constants.dart';
import 'package:movie_app_flutter/domain/entities/cast_entity.dart';
import '../../../../data/remote/endpoints.dart';
import '../../../../theme/theme.dart';

class ItemCastWidget extends StatelessWidget {
  final CastEntity castEntity;

  const ItemCastWidget(this.castEntity, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.only(top: Sizes.dimen_6, left: Sizes.dimen_35, right: Sizes.dimen_10),
          child: Container(
            height: Sizes.dimen_48,
            padding: const EdgeInsets.only(
              top: Sizes.dimen_4,
              left: Sizes.dimen_45,
              right: Sizes.dimen_8,
              bottom: Sizes.dimen_4,
            ),
            decoration: const BoxDecoration(
              color: Colors.black,
              boxShadow: [BoxShadow(color: kColorViolet, spreadRadius: 1)],
              borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_26)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    castEntity.name,
                    style: PrimaryFont.medium(Sizes.dimen_15)
                        .copyWith(color: Colors.white),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    castEntity.character,
                    style: PrimaryFont.medium(Sizes.dimen_12)
                        .copyWith(color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: Sizes.dimen_60,
          height: Sizes.dimen_60,
          padding: const EdgeInsets.all(Sizes.dimen_2),
          margin: const EdgeInsets.only(left: Sizes.dimen_10),
          decoration: const BoxDecoration(
            color: kColorViolet,
            borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_100)),
          ),
          child: ClipRRect(
            borderRadius:
            const BorderRadius.all(Radius.circular(Sizes.dimen_100)),
            child: CachedNetworkImage(
              imageUrl: "${Endpoints.baseUrlImage}${castEntity.profilePath}",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
