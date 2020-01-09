import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';

abstract class GlobalBaseState {
  ///非final 属性会自动生成 getter setter方法
  Color themeColor;

  ///setter 和 getter方法也会增加属性
  // Color get themeColor;
  // set themeColor(Color color);
}

class GlobalState implements GlobalBaseState, Cloneable<GlobalState> {
  @override
  Color themeColor;

  @override
  GlobalState clone() {
    return GlobalState();
  }
}