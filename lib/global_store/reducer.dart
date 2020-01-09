import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_wan/global_store/action.dart';
import 'package:flutter_wan/global_store/state.dart';

Reducer<GlobalState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalState>> {
      GlobalAction.changeThemeColor: _onChangeThemeColor
    },
  );
}

List _colors = [
  Colors.green,
  Colors.blue,
  Colors.black,
];

GlobalState _onChangeThemeColor(GlobalState state, Action action) {
  final Color next =
      _colors[((_colors.indexOf(state.themeColor) + 1) % _colors.length)];
  return state.clone()..themeColor = next;
}