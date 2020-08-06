import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wan/global_store/state.dart';

class WebviewState implements GlobalBaseState, Cloneable<WebviewState> {

  String url;
  String title;

  @override
  WebviewState clone() {
    return WebviewState()
    ..url = url
    ..title = title
    ..themeColor = themeColor;
  }

  @override
  Color themeColor;
}

WebviewState initState(List args) {
  final WebviewState state = WebviewState();
  state.url = args[0];
  state.title = args[1];
  // logger.d('initState*****111 ' + args?.articleListModel?.link);
  // state.url = args?.articleListModel?.link;
  // state.title = args?.articleListModel?.title;
  // state.articleListModel = args?.articleListModel;
  // logger.d('initState*****222 ' + state.articleListModel.link);
  return state;
}
