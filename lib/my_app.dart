import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie_app_flutter/common/constants/languages.dart';
import 'package:movie_app_flutter/common/screenutil/screenutil.dart';
import 'package:movie_app_flutter/di/get_it.dart';
import 'package:movie_app_flutter/presentation/bloc/language/language_cubit.dart';
import '../theme/theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'presentation/app_localizations.dart';
import 'presentation/screen/home/home_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late LanguageCubit _languageCubit;

  @override
  void initState() {
    _languageCubit = getItInstance<LanguageCubit>();
    _languageCubit.loadPreferredLanguage();
    super.initState();
  }

  @override
  void dispose() {
    _languageCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => _languageCubit)],
        child: BlocBuilder<LanguageCubit, Locale>(
          builder: (BuildContext context, Locale state) {
            return MaterialApp(
              theme: ThemeData(
                primaryColor: kColorVulcan,
                colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kColorViolet),
                appBarTheme: const AppBarTheme(color: kColorVulcan),
                fontFamily: PrimaryFont.fontFamily,
                scaffoldBackgroundColor: kColorVulcan,
                textTheme: Theme.of(context)
                    .textTheme
                    .apply(fontFamily: PrimaryFont.fontFamily),
              ),
              supportedLocales: Languages.languages.map((e) => Locale(e.code)).toList(),
              locale: state,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              home: const HomeScreen(),
              debugShowCheckedModeBanner: false,
              builder: DevicePreview.appBuilder,
            );
          },
        ));
  }
}
