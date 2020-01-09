import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomeListComponent extends Component<HomeListState> {
  HomeListComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<HomeListState>(
                adapter: null,
                slots: <String, Dependent<HomeListState>>{
                }),);

}
