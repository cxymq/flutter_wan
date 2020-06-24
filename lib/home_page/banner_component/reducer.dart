import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<BannerState> buildReducer() {
  return asReducer(
    <Object, Reducer<BannerState>>{
      BannerAction.clickImg: _clickImg,
    },
  );
}

BannerState _clickImg(BannerState state, Action action) {
  final BannerState newState = state.clone();
  // ..isClick = true;
  return newState;
}

