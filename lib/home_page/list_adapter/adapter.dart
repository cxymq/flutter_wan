import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wan/home_page/home_cell_component/component.dart';
import 'package:flutter_wan/home_page/home_cell_component/state.dart';

import '../state.dart';
import 'reducer.dart';

class ListAdapter extends DynamicFlowAdapter<HomeState> {
  ListAdapter()
      : super(
          pool: <String, Component<Object>>{
            'homeList': HomeListComponent(),
          },
          connector: _ListConnector(),
          reducer: buildReducer(),
        );
}

class _ListConnector extends ConnOp<HomeState, List<ItemBean>> {
  @override
  List<ItemBean> get(HomeState state) {
    if (state.homeList?.isNotEmpty == true) {
      return state.homeList.map((HomeListState data) => ItemBean('homeList', data)).toList();
    } else {
      return <ItemBean>[];
    }
  }

  @override
  void set(HomeState state, List<ItemBean> items) {
    if (items?.isNotEmpty == true) {
      state.homeList = List<HomeListState>.from(
        items.map((ItemBean bean) => bean.data).toList()
      );
    } else {
      state.homeList = <HomeListState>[];
    }
  }

  // @override
  // subReducer(reducer) {
  //   // TODO: implement subReducer
  //   return super.subReducer(reducer);
  // }
}
