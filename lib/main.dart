import 'dart:async';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../di/get_it.dart' as getIt;
import 'my_app.dart';
import 'dart:io' show Platform;
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  unawaited(getIt.init());
  runApp(
    DevicePreview(
      enabled: !kReleaseMode & !Platform.isIOS & !Platform.isAndroid,
      builder: (context) => const MyApp(),
    ),
  );
}
