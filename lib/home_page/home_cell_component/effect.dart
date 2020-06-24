import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_wan/utils/print_wan.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeListState> buildEffect() {
  return combineEffects(<Object, Effect<HomeListState>>{
    HomeListAction.onClick: _onClick,
  });
}

void _onClick(Action action, Context<HomeListState> ctx) {
  logger.d(ctx.state.articleListModel.link);
  if(action.payload == ctx.state.articleListModel.link) {
    Navigator.of(ctx.context)
    .pushNamed('web_view', arguments: ctx.state)
    // .pushNamed('home')
    .then((dynamic value) {
      
    });
  }
}