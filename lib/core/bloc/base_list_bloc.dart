import 'package:movie_app_flutter/core/bloc/base_event.dart';
import 'package:movie_app_flutter/core/bloc/base_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_status.dart';

abstract class BaseListBloc<E extends BaseEvent, M>
    extends Bloc<E, BaseListState<M>> {
  int currentPage = 1;
  BaseListBloc(super.initialState);

  Future<void> dataFetch(E event, Emitter<BaseListState<M>> emit) async {}

  Future<void> dataRefresh(E event, Emitter<BaseListState<M>> emit) async {
    emit.call(state.copyWith(status: BaseStatus.loadingRefresh));
    await Future.delayed(
      const Duration(seconds: 1),
    );
    currentPage = 1;
    add(event);
  }
}
