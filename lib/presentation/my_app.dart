import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie_app_flutter/common/constants/languages.dart';
import 'package:movie_app_flutter/common/constants/route_constant.dart';
import 'package:movie_app_flutter/common/screenutil/screenutil.dart';
import 'package:movie_app_flutter/common/utils/extensions.dart';
import 'package:movie_app_flutter/di/get_it.dart';
import 'package:movie_app_flutter/presentation/bloc/language/language_cubit.dart';
import 'package:movie_app_flutter/presentation/bloc/theme/theme_cubit.dart';
import 'package:movie_app_flutter/presentation/wiredash_app.dart';
import '../../theme/theme.dart';
import 'app_localizations.dart';
import 'routes.dart';
import 'screen/home/home_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late LanguageCubit _languageCubit;
  late ThemeCubit _themeCubit;

  @override
  void initState() {
    _languageCubit = getItInstance<LanguageCubit>();
    _languageCubit.loadPreferredLanguage();
    _themeCubit = getItInstance<ThemeCubit>();
    _themeCubit.loadPreferredTheme();
    super.initState();
  }

  @override
  void dispose() {
    _languageCubit.close();
    _themeCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => _languageCubit),
          BlocProvider(create: (context) => _themeCubit),
        ],
        child: BlocBuilder<ThemeCubit, Themes>(
          builder: (context, themes) {
            return BlocBuilder<LanguageCubit, Locale>(
              builder: (BuildContext context, Locale state) {
                return WiredashApp(
                  languageCode: state.languageCode,
                  child: MaterialApp(
                    theme: ThemeData(
                      primaryColor: kColorVulcan,
                      colorScheme:
                          ColorScheme.fromSwatch().copyWith(secondary: kColorViolet),
                      appBarTheme: const AppBarTheme(color: kColorVulcan),
                      fontFamily: PrimaryFont.fontFamily,
                      scaffoldBackgroundColor: kColorVulcan,
                      textTheme: Theme.of(context)
                          .textTheme
                          .apply(fontFamily: PrimaryFont.fontFamily),
                    ),
                    supportedLocales:
                        Languages.languages.map((e) => Locale(e.code)).toList(),
                    locale: state,
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    initialRoute: RouteList.initial,
                    onGenerateRoute: (RouteSettings settings){
                      final routes = Routes.getRoutes(settings);
                      final WidgetBuilder? builder = routes[settings.name.value()];
                      return CupertinoPageRoute(settings: settings, builder: builder!);
                    },
                    home: const HomeScreen(),
                    debugShowCheckedModeBanner: false,
                    builder: DevicePreview.appBuilder,
                  ),
                );
              },
            );
          }
        ));
  }
}
