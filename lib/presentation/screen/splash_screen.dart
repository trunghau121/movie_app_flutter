import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/constants/image_constant.dart';
import 'package:movie_app_flutter/common/constants/route_constant.dart';
import 'package:movie_app_flutter/common/constants/size_constants.dart';
import 'package:movie_app_flutter/theme/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    _timer = Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed(RouteList.home);
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kColorViolet,
      child: Center(
          child: Image.asset(
        ImageConstant.iconApp,
        width: Sizes.dimen_100,
        height: Sizes.dimen_100,
      )),
    );
  }
}
