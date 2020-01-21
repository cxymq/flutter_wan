import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wan/global_store/state.dart';
import 'package:flutter_wan/home_page/banner_component/state.dart';
import 'package:flutter_wan/home_page/home_list_component/state.dart';
import 'package:flutter_wan/models/BannerModel.dart';

class HomeState implements GlobalState {

  List<BannerModel> bannerResult = List<BannerModel>();
  List<HomeListState> homeList = List<HomeListState>();

  @override
  Color themeColor;

  @override
  HomeState clone() {
    return HomeState()
    ..themeColor = themeColor
    ..bannerResult = bannerResult;
  }

}

HomeState initState(Map<String, dynamic> args) {
  return HomeState();
}

class BannerConnector extends ConnOp<HomeState, BannerState> with ReselectMixin<HomeState,BannerState> {
  @override
  computed(HomeState state) {
    return BannerState()
    ..bannerResult = state.bannerResult;
  }

  @override
  List factors(HomeState state) {
   
    return [
      state.bannerResult,
    ];
  }

}

// class BannerConnector extends Reselect2<HomeState, BannerState, String, String> {
//   @override
//   BannerState computed(String sub0, String sub1) {
    
//     return BannerState();
//   }

//   @override
//   String getSub0(HomeState state) {
    
//     return null;
//   }

//   @override
//   String getSub1(HomeState state) {
   
//     return null;
//   }

//   @override
//   void set(HomeState state, BannerState subState) {
//      throw Exception('Unexpected to set HomeState from BannerState');
//   }
// }