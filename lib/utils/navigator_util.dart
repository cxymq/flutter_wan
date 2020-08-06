import 'package:flutter/material.dart';
import 'package:flutter_wan/Routs/Routs.dart';
class NavigatorUtil {
  static _navigatorTo(BuildContext context, String path, {List argument}) {
    Navigator.of(context).pushNamed(path, arguments: argument);
  }
  static void pushWebView(BuildContext context, List argument) {
    _navigatorTo(context, Routes.webView, argument: argument);
  }
}
