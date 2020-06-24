import 'package:flutter_wan/home_page/home_cell_component/state.dart';
import 'package:flutter_wan/models/ArticleListModel.dart';
import 'package:flutter_wan/models/BannerModel.dart';
import 'package:flutter_wan/utils/print_wan.dart';

import 'DioManager.dart';
import 'WanUri.dart';

class WanHttpRequest {
  static void requestBanner(Function successCallback, Function errorCallback) {
    List<BannerModel> result = <BannerModel> [];
    DioManager.getInstance().get(WanUri.getPath(path: WanUri.BASE_URL+WanUri.BANNER, resType: 'json'), null, (data) {
      logger.d('获取>>>Banner<<<数据成功 ====== ');
      if(data != null) {
        for (var item in data['data']) {
          result.add(BannerModel.fromJson(item));
        }
        successCallback(true, result);
      }
    }, (error){
      logger.e('获取>>>Banner<<<数据出错 ======> '+ error);
      errorCallback(error);
    });
  }

  static void requestArticleList(int page, Function successCallback, Function errorCallback) {
    List<HomeListState> result = <HomeListState> [];
    DioManager.getInstance().get(WanUri.getPath(path: WanUri.BASE_URL + WanUri.ARTICLE_LIST, page: page, resType: 'json'), null, (data) {
      logger.d('获取>>>ArticleList<<<数据成功 ====== ');
      if(data != null) {
        for (var item in data['data']['datas']) {
          var homeListState = HomeListState(articleListModel: ArticleListModel.fromJson(item));
          result.add(homeListState);
        }
        successCallback(true, result);
      }
    }, (error){
      logger.e('获取>>>ArticleList<<<数据出错 ======> '+ error);
      errorCallback(error);
    });
  }
}