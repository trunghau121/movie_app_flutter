import 'dart:async';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../di/get_it.dart' as getIt;
import 'my_app.dart';
import 'dart:io' show Platform;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(getIt.init());
  runApp(
    DevicePreview(
      enabled: !kReleaseMode & !Platform.isIOS & !Platform.isAndroid,
      builder: (context) => const MyApp(),
    ),
  );
}
