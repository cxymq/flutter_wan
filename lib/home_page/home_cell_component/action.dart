import 'package:fish_redux/fish_redux.dart';

enum HomeListAction { 
  onClick,
  click,
 }

class HomeListActionCreator {
  static Action onClickAction(String url) {
    return Action(HomeListAction.onClick, payload: url);
  }

  static Action clickAction() {
    return Action(HomeListAction.onClick);
  }
}
