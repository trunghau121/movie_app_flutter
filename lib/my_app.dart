import '../theme/theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: kColorPrimarySecond),
        fontFamily: PrimaryFont.fontFamily,
        textTheme: Theme.of(context)
            .textTheme
            .apply(fontFamily: PrimaryFont.fontFamily),
      ),
      home: Container(),
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
    );
  }
}
