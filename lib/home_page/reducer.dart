import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wan/home_page/banner_component/state.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.initBanners: _initBannersReducer,
    },
  );
}

HomeState _initBannersReducer(HomeState state, Action action) {
  final List<BannerState> bannerResult = action.payload ?? <BannerState> [];
  final HomeState newState = state.clone();
  newState.bannerResult = bannerResult;
  return newState;
}
