import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wan/http/WanHttpRequest.dart';
import 'package:flutter_wan/models/BannerModel.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    Lifecycle.initState: _init,
  });
}

void _init(Action action, Context<HomeState> ctx) {
  WanHttpRequest.requestBanner((isSuccess, List<BannerModel> result){
    if(isSuccess == true) {
     ctx.dispatch(HomeActionCreator.initBannersAction(result));
    }
  },(error) {

  });
}