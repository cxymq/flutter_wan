import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_wan/common/GlobalConfig.dart';
import 'package:flutter_wan/home_page/banner_component/state.dart';
import 'package:flutter_wan/view_models/BannerViewModel.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    Lifecycle.initState: _init,
  });
}

void _init(Action action, Context<HomeState> ctx) {
BannerViewModel bannerVM = BannerViewModel();
  bannerVM.requestResult(GlobalConfig.BANNER_URL, (isSuccess, List<BannerState> result){
    if(isSuccess == true) {
     ctx.dispatch(HomeActionCreator.initBannersAction(result));
    }
  },(error) {

  });
}