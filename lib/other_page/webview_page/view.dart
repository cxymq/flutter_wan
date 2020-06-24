import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan/utils/print_wan.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(WebviewState state, Dispatch dispatch, ViewService viewService) {
  logger.d('buildView' + state.title);
  return WebviewScaffold(
      url: state.url != null ? state.url : 'www.baidu.com',
      appBar: new AppBar(
        backgroundColor: state.themeColor,
        title: new Text(state.title != null ? state.title : 'wan'),
      ),
      withZoom: true,
      // 允许网页缩放
      withLocalStorage: true,
      // 允许LocalStorage
      withJavascript: true, // 允许执行js代码
    );
}
