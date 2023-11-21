import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../common/constants/size_constants.dart';
import '../../../theme/theme.dart';

class ReviewButtonWidget extends StatelessWidget {
  final String voteAverage;

  const ReviewButtonWidget(this.voteAverage, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Sizes.dimen_16),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5.0,
          sigmaY: 5.0,
        ),
        child: Container(
          color: kColorViolet.withOpacity(0.1),
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.dimen_6,
            horizontal: Sizes.dimen_16,
          ),
          child: Row(
            children: [
              const Icon(Icons.star, size: Sizes.dimen_18, color: Colors.white),
              const SizedBox(width: Sizes.dimen_4),
              Text(
                voteAverage,
                style: PrimaryFont.medium(Sizes.dimen_14)
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
