import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wan/home_page/home_cell_component/state.dart' as hs;

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class WebviewPage extends Page<WebviewState, hs.HomeListState> {
  WebviewPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            // dependencies: Dependencies<WebviewState>(
            //     adapter: null,
            //     slots: <String, Dependent<WebviewState>>{
            //     }),
            // middleware: <Middleware<WebviewState>>[
            // ],
            );

}
