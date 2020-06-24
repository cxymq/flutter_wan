import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wan/global_store/state.dart';
import 'package:flutter_wan/home_page/home_cell_component/state.dart';
import 'package:flutter_wan/utils/print_wan.dart';

class WebviewState implements GlobalBaseState, Cloneable<WebviewState> {

  String url;
  String title;

  @override
  WebviewState clone() {
    return WebviewState()
    ..url
    ..title
    ..themeColor;
  }

  @override
  Color themeColor;
}

WebviewState initState(HomeListState args) {
  WebviewState state = WebviewState();
  // HomeListState homeState = args?.clone();
  logger.d('initState***** ' + args.articleListModel.link);
  state.url = args.articleListModel.link;
  state.title = args.articleListModel.title;
  logger.d('initState***** ' + state.title);
  return state;
}
