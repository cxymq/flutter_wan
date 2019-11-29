import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CarouselState> buildReducer() {
  return asReducer(
    <Object, Reducer<CarouselState>>{
      CarouselAction.action: _onAction,
    },
  );
}

CarouselState _onAction(CarouselState state, Action action) {
  final CarouselState newState = state.clone();
  return newState;
}
