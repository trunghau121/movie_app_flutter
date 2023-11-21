import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app_flutter/common/utils/navigation_util.dart';
import '../../../common/constants/icons_constant.dart';
import '../../../common/constants/size_constants.dart';
import '../../bloc/video/video_cubit.dart';
import '../../bloc/video/video_state.dart';

class WatchVideosButton extends StatelessWidget {
  const WatchVideosButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoCubit, VideoState>(
      builder: (BuildContext context, VideoState state) {
        if(state is VideoLoaded && state.videoEntities.isNotEmpty){
          return GestureDetector(
            onTap: (){
              NavigationUtil.gotoWatchVideos(context, state.videoEntities);
            },
            child: SvgPicture.asset(IconsConstant.iconPlay, width: Sizes.dimen_60, height: Sizes.dimen_60),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
