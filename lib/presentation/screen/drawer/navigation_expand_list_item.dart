import 'package:flutter/material.dart';
import 'package:movie_app_flutter/presentation/screen/drawer/navigation_list_item.dart';

import '../../../common/constants/size_constants.dart';
import '../../../theme/theme.dart';

class NavigationExpanedListItem extends StatelessWidget {
  final String title;
  final Function(int) onPressed;
  final List<String> itemChilds;

  const NavigationExpanedListItem(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.itemChilds});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 2,
          ),
        ],
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: PrimaryFont.medium(Sizes.dimen_18)
              .copyWith(color: Colors.white),
        ),
        children: [
          for (int i = 0; i < itemChilds.length; i++)
            NavigationSubListItem(title: itemChilds[i], onPressed: () {
              onPressed(i);
            })
        ],
      ),
    );
  }
}
