import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(HomeListState state, Dispatch dispatch, ViewService viewService) {
  return Container(padding: const EdgeInsets.all(8.0),
    child: Container(
      padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 24.0),
      color: const Color(0xFFE0E0E0),
      child: Row(children: <Widget>[
        Expanded(
          child: Container(
            child: Column (children: <Widget>[
              Text(
                state.articleListModel.title,
                style: const TextStyle(color: Colors.black, fontSize: 16.0),
              ),
              Text(
                state.articleListModel.author.length > 0 ? '作者' : '分享人',
                style: const TextStyle(color: Colors.black, fontSize: 16.0),
              )
            ],)
          ),
        ),
        GestureDetector(
          child: Container(
            child: const Icon(Icons.edit),
          ),
          onTap: () {
            dispatch(HomeListActionCreator.onClickAction(state.articleListModel.link.length>0 ? state.articleListModel.link : ''));
          },
        )
      ],),
    ),
  );
}
