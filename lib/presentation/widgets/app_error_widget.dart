import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/constants/languages.dart';
import 'package:movie_app_flutter/common/utils/extensions.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_32),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            contentError.translator(context),
            textAlign: TextAlign.center,
            style: PrimaryFont.medium(Sizes.dimen_15).copyWith(color: Colors.white),
          ),
          ButtonBar(
            children: [
              Button(
                onPressed: onPressed,
                text: Languages.retry.translator(context),
              ),
              Button(
                onPressed: () => {},
                text: Languages.feedback.translator(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
