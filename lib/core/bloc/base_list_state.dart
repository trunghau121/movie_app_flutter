import 'package:movie_app_flutter/core/bloc/base_state.dart';
import 'package:movie_app_flutter/core/bloc/base_status.dart';

class BaseListState<T> extends BaseState {
  final List<T> listData;
  final bool hasReachedMax;
  final BaseStatus status;
  final String error;
  const BaseListState({
    this.listData = const [],
    this.hasReachedMax = false,
    this.status = BaseStatus.initial,
    this.error = "",
  });

  BaseListState<T> copyWith({
    List<T>? listData,
    bool? hasReachedMax,
    BaseStatus? status,
    String? error,
  }) {
    return BaseListState(
      listData: listData ?? this.listData,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [listData, hasReachedMax, status];
}
