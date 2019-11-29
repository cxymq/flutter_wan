import 'dart:ui';

import 'package:flutter/material.dart';

class CustomLocalizations {

  CustomLocalizations(this.isZh);
  //是否为中文
  bool isZh = false;

  static CustomLocalizations of(BuildContext context) {
    return Localizations.of(context, CustomLocalizations);
  }

  static Map<String, Map<String, String>> _localValues = {
    'en': {"title" : "anwan"},
    'zh': {"title" : "爱玩"},
  };

  String get title {
    return isZh ? "Flutter应用" : "Flutter APP";
  }

}