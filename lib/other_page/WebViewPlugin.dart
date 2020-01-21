import 'package:flutter/material.dart' hide Action;
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class WebViewPlugin extends StatefulWidget {
  @override
  _WebViewPluginState createState() => _WebViewPluginState();
}

class _WebViewPluginState extends State<WebViewPlugin> {
  String url;

  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      url: url,
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