import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/extensions/size_extensions.dart';
import 'package:movie_app_flutter/theme/theme.dart';
import '../../common/constants/size_constants.dart';
import 'button.dart';

class AppErrorWidget extends StatelessWidget {
  final String contentError;
  final DioExceptionType exceptionType;
  final Function() onPressed;
  const AppErrorWidget({super.key, required this.contentError, required this.exceptionType, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_32.w),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            contentError,
            textAlign: TextAlign.center,
            style: PrimaryFont.medium(15),
          ),
          ButtonBar(
            children: [
              Button(
                onPressed: onPressed,
                text: "Retry",
              ),
              Button(
                onPressed: () => {},
                text: "FeelBack",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
