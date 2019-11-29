import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<CarouselState> buildEffect() {
  return combineEffects(<Object, Effect<CarouselState>>{
    CarouselAction.action: _onAction,
  });
}

void _onAction(Action action, Context<CarouselState> ctx) {
}
