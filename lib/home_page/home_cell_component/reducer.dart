import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeListState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeListState>>{
      HomeListAction.click: _click,
    },
  );
}

HomeListState _click(HomeListState state, Action action) {
  final HomeListState newState = state.clone();
  return newState;
}
