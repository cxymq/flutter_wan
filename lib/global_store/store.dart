import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wan/global_store/reducer.dart';
import 'package:flutter_wan/global_store/state.dart';

class GlobalStore {
  static Store<GlobalState> _globalStore;

  static Store<GlobalState> get store => _globalStore ??= createStore(GlobalState(), buildReducer());
  
}