import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wan/models/ArticleListModel.dart';

class HomeListState implements Cloneable<HomeListState> {

  ArticleListModel articleListModel;
  // String title;//标题
  // String desc;//描述

  HomeListState({this.articleListModel});

  @override
  HomeListState clone() {
    return HomeListState()
    ..articleListModel;
  }
}

HomeListState initState(Map<String, dynamic> args) {
  return HomeListState();
}
