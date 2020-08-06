import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wan/home_page/banner_component/state.dart';

enum BannerAction { 
  onClickImg,//点击
  clickImg,//点击
 }

class BannerActionCreator {
  static Action onClickImg(String url, String title) {
    return Action(BannerAction.onClickImg, payload: [url, title]);
  }

  static Action clickImg(String url, String title) {
    return const Action(BannerAction.clickImg);
  }

}
