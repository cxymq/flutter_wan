import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CarouselComponent extends Component<CarouselState> {
  CarouselComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CarouselState>(
                adapter: null,
                slots: <String, Dependent<CarouselState>>{
                }),);

}
