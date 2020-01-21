import 'package:flutter_wan/models/BannerModel.dart';

import 'DioManager.dart';
import 'WanUri.dart';

class WanHttpRequest {
  static void requestBanner(Function successCallback, Function errorCallback) {
    List<BannerModel> result = <BannerModel> [];
    DioManager.getInstance().get(WanUri.getPath(path: WanUri.BASE_URL+WanUri.BANNER, resType: 'json'), null, (data) {
      print('获取>>>Banner<<<数据成功 ====== ');
      if(data != null) {
        for (var item in data['data']) {
          result.add(BannerModel.fromJson(item));
        }
        successCallback(true, result);
      }
    }, (error){
      print('获取>>>Banner<<<数据出错 ======> '+ error);
      errorCallback(error);
    });
  }
}