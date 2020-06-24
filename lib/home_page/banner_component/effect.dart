import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter/widgets.dart' hide Action;
import 'package:flutter_wan/utils/print_wan.dart';
import 'action.dart';
import 'state.dart';

Effect<BannerState> buildEffect() {
  return combineEffects(<Object, Effect<BannerState>>{
    BannerAction.onClickImg: _onClickImg,
  });
}


void _onClickImg(Action action, Context<BannerState> ctx) {
  logger.d(action.payload);
  if(action.payload != null) {
    Navigator.of(ctx.context)
    .pushNamed('web_view', arguments: action.payload)
    .then((dynamic value) {
      
    });
  }
}
