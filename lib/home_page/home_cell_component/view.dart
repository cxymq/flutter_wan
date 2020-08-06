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
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column (children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  state.articleListModel.title,
                  style: const TextStyle(color: Colors.black, fontSize: 16.0),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child:  Row (children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Text(
                      state.articleListModel.author.length > 0 ? state.articleListModel.author : state.articleListModel.shareUser,
                      style: const TextStyle(color: Colors.grey, fontSize: 14.0),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      state.articleListModel.niceDate,
                      style: const TextStyle(color: Colors.grey, fontSize: 14.0),
                      textAlign: TextAlign.right,
                    ),
                  )
                ],)
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
