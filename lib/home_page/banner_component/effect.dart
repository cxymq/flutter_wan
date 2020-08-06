import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wan/utils/navigator_util.dart';
import 'package:flutter_wan/utils/print_wan.dart';
import 'action.dart';
import 'state.dart';

Effect<BannerState> buildEffect() {
  return combineEffects(<Object, Effect<BannerState>>{
    BannerAction.onClickImg: _onClickImg,
  });
}

void _onClickImg(Action action, Context<BannerState> ctx) {
  logger.d(action.payload);
  if(action.payload != null) {
    NavigatorUtil.pushWebView(ctx.context, action.payload);
  }
}
