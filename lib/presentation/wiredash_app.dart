import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiredash/wiredash.dart';
import '../theme/theme.dart';
import 'bloc/theme/theme_cubit.dart';

class WiredashApp extends StatelessWidget {
  final Widget child;
  final String languageCode;

  const WiredashApp({
    Key? key,
    required this.languageCode,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = context.read<ThemeCubit>().state == Themes.dark;
    return Wiredash(
      projectId: 'movieapp-ar4ehk9',
      secret: 'B-TSspbOP7gslKCZoyVIENWH_ZE-KTVW',
      options: WiredashOptionsData(
        locale: Locale.fromSubtags(
          languageCode: languageCode,
        ),
      ),
      theme: WiredashThemeData(
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        primaryColor: kColorRoyalBlue,
        secondaryColor: kColorViolet,
        secondaryBackgroundColor: isDarkTheme ? kColorVulcan : Colors.white,
        textOnPrimaryContainerColor: isDarkTheme ? Colors.white : kColorVulcan,
        textOnSecondaryContainerColor: isDarkTheme ? Colors.white : kColorVulcan,
      ),
      child: child,
    );
  }
}
