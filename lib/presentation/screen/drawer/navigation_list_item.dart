import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/constants/size_constants.dart';
import 'package:movie_app_flutter/common/extensions/size_extensions.dart';
import 'package:movie_app_flutter/theme/theme.dart';

class NavigationListItem extends StatelessWidget {
  final String title;
  final Function() onPressed;
  const NavigationListItem(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.7),
              blurRadius: 2,
            ),
          ],
        ),
        child: ListTile(
          title: Text(
            title,
            style: PrimaryFont.medium(Sizes.dimen_18.sp)
                .copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class NavigationSubListItem extends StatelessWidget {
  final String title;
  final Function() onPressed;
  const NavigationSubListItem(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.only(left: Sizes.dimen_18.w),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.7),
              blurRadius: 2,
            ),
          ],
        ),
        child: ListTile(
          title: Text(
            title,
            style: PrimaryFont.medium(Sizes.dimen_16.sp)
                .copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
