import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/common/constants/image_constant.dart';
import 'package:movie_app_flutter/common/constants/languages.dart';
import 'package:movie_app_flutter/common/constants/size_constants.dart';
import 'package:movie_app_flutter/common/utils/extensions.dart';
import 'package:movie_app_flutter/presentation/bloc/language/language_cubit.dart';
import 'package:movie_app_flutter/presentation/screen/drawer/navigation_expand_list_item.dart';
import 'package:movie_app_flutter/presentation/screen/drawer/navigation_list_item.dart';
import 'package:movie_app_flutter/theme/theme.dart';
import 'package:wiredash/wiredash.dart';

import '../../widgets/app_dialog.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 5,
          ),
        ],
      ),
      width: Sizes.dimen_300,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: Sizes.dimen_40,
                bottom: Sizes.dimen_40,
              ),
              child: Center(
                child: Text(
                  "MOVIE",
                  textAlign: TextAlign.center,
                  style: PrimaryFont.semiBold(Sizes.dimen_40)
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
            NavigationListItem(
              title: Languages.favoriteMovies.translator(context),
              onPressed: () {
                Scaffold.of(context).closeDrawer();
              },
            ),
            NavigationExpanedListItem(
              title: Languages.language.translator(context),
              onPressed: (index) {
                Scaffold.of(context).closeDrawer();
                context.read<LanguageCubit>().toggleLanguage(Languages.languages[index]);
              },
              itemChilds: Languages.languages.map((e) => e.value).toList(),
            ),
            NavigationListItem(
              title: Languages.feedback.translator(context),
              onPressed: () {
                Scaffold.of(context).closeDrawer();
                Wiredash.of(context).show();
              },
            ),
            NavigationListItem(
              title: Languages.about.translator(context),
              onPressed: () {
                Scaffold.of(context).closeDrawer();
                _showDialog(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AppDialog(
        title: Languages.about,
        description: Languages.aboutDescription,
        buttonText: Languages.okay,
        image: Image.asset(
          ImageConstant.tmdbLogo,
          height: Sizes.dimen_48,
        ),
      ),
    );
  }
}
