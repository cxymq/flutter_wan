import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  ///创建在page的 Dependencies 中配置的 adapter
  final ListAdapter adapter = viewService.buildAdapter();

  return Scaffold(
    appBar: AppBar(
      backgroundColor: state.themeColor,
      title: const Text('首页'),
    ),
    body: Container(
      child: Column(
        children: <Widget>[
          viewService.buildComponent('banner'),
          Expanded(
            child: ListView.builder(
              itemBuilder: adapter.itemBuilder,
              itemCount: adapter.itemCount,
            ),
          ),
        ],
      ),
    ),
  );
}
