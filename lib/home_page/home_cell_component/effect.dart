import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wan/utils/navigator_util.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeListState> buildEffect() {
  return combineEffects(<Object, Effect<HomeListState>>{
    HomeListAction.onClick: _onClick,
  });
}

void _onClick(Action action, Context<HomeListState> ctx) {
  if(action.payload == ctx.state.articleListModel.link) {
    NavigatorUtil.pushWebView(ctx.context, 
    [ctx.state.articleListModel.link, ctx.state.articleListModel.title]);
  }
}