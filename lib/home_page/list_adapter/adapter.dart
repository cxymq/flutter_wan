import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wan/home_page/home_list_component/component.dart';

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
    // return state.homeList.map(Home);
    return <ItemBean>[];
  }

  @override
  void set(HomeState state, List<ItemBean> items) {
  }

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}
