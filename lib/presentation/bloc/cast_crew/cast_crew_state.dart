import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/cast_entity.dart';

abstract class CastCrewState extends Equatable{
  @override
  List<Object?> get props => [];
}

class CastCrewInit extends CastCrewState{}
class CastCrewLoading extends CastCrewState{}
class CastCrewLoaded extends CastCrewState{
  final List<CastEntity> data;
  CastCrewLoaded(this.data);
  @override
  List<Object?> get props => [data];
}
class CastCrewError extends CastCrewState{
  final String message;
  final DioExceptionType type;
  CastCrewError(this.message, this.type);
  @override
  List<Object?> get props => [message, type];
}
