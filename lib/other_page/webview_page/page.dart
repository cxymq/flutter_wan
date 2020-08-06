import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'view.dart';

class WebviewPage extends Page<WebviewState, List> {
  WebviewPage()
      : super(
            initState: initState,
            view: buildView,
            // dependencies: Dependencies<WebviewState>(
            //     adapter: null,
            //     slots: <String, Dependent<WebviewState>>{
            //     }),
            // middleware: <Middleware<WebviewState>>[
            // ],
            );

}
