import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wan/home_page/banner_component/state.dart';
import 'package:flutter_wan/models/BannerModel.dart';

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
  final List<BannerModel> bannerResult = action.payload ?? <BannerModel> [];
  final HomeState newState = state.clone();
  newState.bannerResult = bannerResult;
  return newState;
}
