import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/video_entity.dart';

abstract class VideoState extends Equatable{
  @override
  List<Object?> get props => [];
}
class VideoInit extends VideoState{}
class VideoLoading extends VideoState{}
class VideoLoaded extends VideoState{
  final List<VideoEntity> videoEntities;
  VideoLoaded(this.videoEntities);
}
class VideoError extends VideoState{
  final String message;
  final DioExceptionType type;
  VideoError(this.message, this.type);
}