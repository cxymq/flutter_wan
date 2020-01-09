import 'package:flutter_wan/http/DioManager.dart';
import 'package:flutter_wan/models/BannerModel.dart';
import 'package:flutter_wan/view_models/BaseViewModel.dart';

class BannerViewModel extends BaseViewModel{
  
  void requestBanner(String uri, Function successCallback, Function errorCallback) {
    requestResult(uri, successCallback,  errorCallback);
  }

  @override
  void requestResult(String uri, Function successCallback, Function errorCallback)  {
    DioManager.getInstance().get(uri, null, (data) {
      if(data != null) {
        for (var item in data['data']) {
          result.add(BannerModel.fromJson(item));
        }
        successCallback(true, result);
      }
    }, (error){
      print('获取>>>'+uri+'<<<数据出错 ======> '+ error);
      errorCallback(error);
    });

  }

  @override
  int getCount() {
    if(result != null) {
      return result.length;
    }
    return 0;
  }
  

}