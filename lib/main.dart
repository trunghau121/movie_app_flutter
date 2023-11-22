import 'dart:async';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:movie_app_flutter/data/table/movie_table.dart';
import '../di/get_it.dart' as getIt;
import 'presentation/my_app.dart';
import 'dart:io' show Platform;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter/services.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(MovieTableAdapter());
  unawaited(getIt.init());
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    DevicePreview(
      enabled: !kReleaseMode & !Platform.isIOS & !Platform.isAndroid,
      builder: (context) => const MyApp(),
    ),
  );
}
