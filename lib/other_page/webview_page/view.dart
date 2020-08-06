import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'state.dart';

Widget buildView(WebviewState state, Dispatch dispatch, ViewService viewService) {
  return WebviewScaffold(
      url: "http://www.baidu.com",
      appBar: new AppBar(
        backgroundColor: state.themeColor != null ? state.themeColor : Colors.white,
        title: new Text(state.title != null ? state.title : 'wan'),
        elevation: 1,
      ),
      withZoom: false,
      // 允许网页缩放
      withLocalStorage: false,
      // 允许LocalStorage
      withJavascript: true, // 允许执行js代码 
    );
}
