import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app_flutter/common/constants/icons_constant.dart';
import 'package:movie_app_flutter/theme/theme.dart';
import '../../common/constants/size_constants.dart';
import '../../common/screenutil/screenutil.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil.statusBarHeight + Sizes.dimen_10,
        left: Sizes.dimen_16,
        right: Sizes.dimen_16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () => {Scaffold.of(context).openDrawer()},
            icon: SvgPicture.asset(IconsConstant.menu),
          ),
          Text("MOVIE",
              style: PrimaryFont.bold(Sizes.dimen_32)
                  .copyWith(color: Colors.white)),
          IconButton(
            onPressed: () => {},
            icon: const Icon(
              Icons.search_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
