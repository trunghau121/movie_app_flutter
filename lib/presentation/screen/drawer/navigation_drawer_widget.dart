import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/common/constants/languages.dart';
import 'package:movie_app_flutter/common/constants/size_constants.dart';
import 'package:movie_app_flutter/common/extensions/size_extensions.dart';
import 'package:movie_app_flutter/common/utils/extensions.dart';
import 'package:movie_app_flutter/presentation/bloc/language/language_cubit.dart';
import 'package:movie_app_flutter/presentation/screen/drawer/navigation_expand_list_item.dart';
import 'package:movie_app_flutter/presentation/screen/drawer/navigation_list_item.dart';
import 'package:movie_app_flutter/theme/theme.dart';

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
      width: Sizes.dimen_300.w,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: Sizes.dimen_8.w,
                bottom: Sizes.dimen_10.h,
              ),
              child: Center(
                child: Text(
                  "MOVIE",
                  textAlign: TextAlign.center,
                  style: PrimaryFont.semiBold(Sizes.dimen_40.sp)
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
              },
            ),
            NavigationListItem(
              title: Languages.about.translator(context),
              onPressed: () {
                Scaffold.of(context).closeDrawer();
              },
            )
          ],
        ),
      ),
    );
  }
}
