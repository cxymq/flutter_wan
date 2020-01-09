import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wan/home_page/banner_component/component.dart';
import 'list_adapter/adapter.dart' as AdatperA;

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomePage extends Page<HomeState, Map<String, dynamic>> {
  HomePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<HomeState>(
                adapter: NoneConn<HomeState>() + AdatperA.ListAdapter(),
                slots: <String, Dependent<HomeState>>{
                  'banner': BannerConnector() + BannerComponent()
                }
            ),
            // middleware: <Middleware<HomeState>>[
            // ],
            );

}
