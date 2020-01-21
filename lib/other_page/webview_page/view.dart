import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(WebviewState state, Dispatch dispatch, ViewService viewService) {
  return new WebviewScaffold(
      url: state.url,
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
