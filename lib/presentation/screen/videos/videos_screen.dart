import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/constants/languages.dart';
import 'package:movie_app_flutter/common/utils/extensions.dart';
import 'package:movie_app_flutter/presentation/screen/videos/videos_arguments.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../common/constants/size_constants.dart';
import '../../../theme/theme.dart';

class VideosScreen extends StatefulWidget {
  final VideosArguments videosArguments;

  const VideosScreen(this.videosArguments, {super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.videosArguments.videos[0].key,
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
    var _videos = widget.videosArguments.videos;
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
                          height: Sizes.dimen_60,
                          padding:
                          const EdgeInsets.symmetric(vertical: Sizes.dimen_8),
                          child: Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  _controller.load(_videos[i].key);
                                  _controller.play();
                                },
                                child: Image.network(
                                  YoutubePlayer.getThumbnail(
                                    videoId: _videos[i].key,
                                    quality: ThumbnailQuality.high,
                                  ),
                                  width: Sizes.dimen_100,
                                  height: Sizes.dimen_100,
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
