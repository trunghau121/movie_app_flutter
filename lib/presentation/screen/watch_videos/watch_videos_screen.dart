import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/constants/languages.dart';
import 'package:movie_app_flutter/common/utils/extensions.dart';
import 'package:movie_app_flutter/domain/entities/video_entity.dart';
import 'package:movie_app_flutter/presentation/screen/watch_videos/watch_videos_arguments.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../common/constants/size_constants.dart';
import '../../../theme/theme.dart';

class WatchVideosScreen extends StatefulWidget {
  final WatchVideosArguments videosArguments;

  const WatchVideosScreen(this.videosArguments, {super.key});

  @override
  State<WatchVideosScreen> createState() => _WatchVideosScreenState();
}

class _WatchVideosScreenState extends State<WatchVideosScreen> {
  late YoutubePlayerController _controller;
  late List<VideoEntity> _videos;
  int _selectedIndex = 0;

  @override
  void initState() {
    _videos = widget.videosArguments.videos;
    _controller = YoutubePlayerController(
      initialVideoId: _videos[0].key,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Languages.watchTrailers.translator(context),
          style:
          PrimaryFont.medium(Sizes.dimen_20).copyWith(color: Colors.white),
        ),
      ),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
        ),
        builder: (context, widget) {
          return Column(
            children: [
              widget,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0; i < _videos.length; i++)
                        Container(
                          padding:
                          const EdgeInsets.symmetric(vertical: Sizes.dimen_8, horizontal: Sizes.dimen_8),
                          decoration: BoxDecoration(
                            color: _selectedIndex == i ? kColorViolet : Colors.transparent
                          ),
                          child: GestureDetector(
                            onTap: () {
                              _controller.load(_videos[i].key);
                              _controller.play();
                              setState(() {
                                _selectedIndex = i;
                              });
                            },
                            child: Row(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(Radius.circular(Sizes.dimen_16)),
                                  child: Image.network(
                                    YoutubePlayer.getThumbnail(
                                      videoId: _videos[i].key,
                                      quality: ThumbnailQuality.high,
                                    ),
                                    fit: BoxFit.cover,
                                    width: Sizes.dimen_80,
                                    height: Sizes.dimen_80,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: Sizes.dimen_8),
                                    child: Text(
                                      _videos[i].name,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: PrimaryFont.medium(Sizes.dimen_18)
                                        .copyWith(color: Colors.white)
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
