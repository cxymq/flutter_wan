import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter/widgets.dart' hide Action;
import 'package:flutter_wan/common/GlobalConfig.dart';
import 'package:flutter_wan/view_models/BannerViewModel.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'action.dart';
import 'state.dart';

Effect<BannerState> buildEffect() {
  return combineEffects(<Object, Effect<BannerState>>{
    // Lifecycle.initState: _init,
    BannerAction.onClickImg: _onClickImg,
  });
}

// void _init(Action action, Context<BannerState> ctx) {
// BannerViewModel bannerVM = BannerViewModel();
//   bannerVM.requestResult(GlobalConfig.BANNER_URL, (isSuccess, List<BannerState> result){
//     if(isSuccess == true) {
//      ctx.dispatch(BannerActionCreator.hadLoaded(result));
//     }
//   },(error) {

//   });
// }

void _onClickImg(Action action, Context<BannerState> ctx) {
  if(action.payload != null) {
    WebViewPlugin(action, ctx);
  }
}

Widget WebViewPlugin(Action action, Context<BannerState> ctx) {
  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      url: action.payload,
      appBar: new AppBar(
        title: new Text('轮播图'),
      ),
      withZoom: true,
      // 允许网页缩放
      withLocalStorage: true,
      // 允许LocalStorage
      withJavascript: true, // 允许执行js代码
    );
  }
} 
