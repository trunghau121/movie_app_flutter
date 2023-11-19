import 'package:movie_app_flutter/common/screenutil/screenutil.dart';
import '../theme/theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'presentation/screen/home/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: kColorVulcan),
        fontFamily: PrimaryFont.fontFamily,
        scaffoldBackgroundColor: kColorVulcan,
        textTheme: Theme.of(context)
            .textTheme
            .apply(fontFamily: PrimaryFont.fontFamily),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
    );
  }
}
