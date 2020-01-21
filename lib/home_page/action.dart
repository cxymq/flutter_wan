import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wan/home_page/banner_component/state.dart';
import 'package:flutter_wan/models/BannerModel.dart';

enum HomeAction { 
  initBanners, //初始化轮播图列表
  initHomeList, //初始化新闻列表
 }

class HomeActionCreator {
  static Action initBannersAction(List<BannerModel> banners) {
    return Action(HomeAction.initBanners, payload: banners);
  }

  static Action initHomeListAction() {
    return const Action(HomeAction.initHomeList);
  }
}
