import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/presentation/bloc/video/video_state.dart';
import '../../../domain/usecases/get_video.dart';

class VideoCubit extends Cubit<VideoState> {
  final GetVideo getVideo;

  VideoCubit(this.getVideo) : super(VideoInit());

  Future<void> loadVideos(int movieId) async {
    (await getVideo(movieId)).when(
        success: (data) => {emit(VideoLoaded(data!))},
        error: (message, type) => {emit(VideoError(message, type))});
  }
}
