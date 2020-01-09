import 'package:fish_redux/fish_redux.dart';

class HomeListState implements Cloneable<HomeListState> {

  String title;//标题
  String desc;//描述

  HomeListState({this.title, this.desc});

  @override
  HomeListState clone() {
    return HomeListState()
    ..title
    ..desc;
  }
}

HomeListState initState(Map<String, dynamic> args) {
  return HomeListState();
}
