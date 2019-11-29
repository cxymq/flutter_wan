import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CarouselAction { action }

class CarouselActionCreator {
  static Action onAction() {
    return const Action(CarouselAction.action);
  }
}
