import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wan/models/BannerModel.dart';

import 'action.dart';
import 'home_cell_component/state.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.initBanners: _initBannersReducer,
      HomeAction.initHomeList: _initHomeListReducer,
    },
  );
}

HomeState _initBannersReducer(HomeState state, Action action) {
  final List<BannerModel> bannerResult = action.payload ?? <BannerModel> [];
  final HomeState newState = state.clone();
  newState.bannerResult = bannerResult;
  return newState;
}

HomeState _initHomeListReducer(HomeState state, Action action) {
  final List<HomeListState> articlesResult = action.payload ?? <HomeListState> [];
  final HomeState newState = state.clone();
  newState.homeList = articlesResult;
  return newState;
}
