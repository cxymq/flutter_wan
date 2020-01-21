import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wan/models/BannerModel.dart';

class BannerState implements Cloneable<BannerState> {
  // bool isClick;//是否已点击
  // String imagePath;
  // String title;
  // bool isLoaded;//数据是否已加载
  List<BannerModel> bannerResult;

  BannerState({
  //   this.isClick = false
  // , this.imagePath, this.title, this.isLoaded = false, 
  this.bannerResult
  });

  @override
  BannerState clone() {
    return BannerState()
    // ..isClick = isClick
    // ..imagePath = imagePath
    // ..title = title
    // ..isLoaded = isLoaded
    ..bannerResult = bannerResult
    ;
  }

  @override
  String toString() {
    return 'CarouseState(isClick: $bannerResult)';
  }
}

BannerState initState(Map<String, dynamic> args) {
  return BannerState();
}
