import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/constants/size_constants.dart';

class AppbarDetailMovieWidget extends StatelessWidget {
  const AppbarDetailMovieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 5,
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: Sizes.dimen_26,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Padding(
            padding: EdgeInsets.only(right: Sizes.dimen_16),
            child: Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: Sizes.dimen_26,
            ),
          ),
        )
      ],
    );
  }
}
