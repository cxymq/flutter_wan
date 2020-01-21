import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter/widgets.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<BannerState> buildEffect() {
  return combineEffects(<Object, Effect<BannerState>>{
    BannerAction.onClickImg: _onClickImg,
  });
}


void _onClickImg(Action action, Context<BannerState> ctx) {
  if(action.payload != null) {
    Navigator.of(ctx.context)
    .pushNamed('webView', arguments: action.payload);
  }
}
