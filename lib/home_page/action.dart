import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wan/home_page/banner_component/state.dart';

enum HomeAction { 
  initBanners, //初始化轮播图列表
  initHomeList, //初始化新闻列表
 }

class HomeActionCreator {
  static Action initBannersAction(List<BannerState> banners) {
    return const Action(HomeAction.initBanners);
  }

  static Action initHomeListAction() {
    return const Action(HomeAction.initHomeList);
  }
}
