import 'package:flutter_wan/http/DioManager.dart';
///基类

class BaseViewModel {
  ///存放网络请求的结果
  List result;

  void requestResult(String uri) {
    DioManager.getInstance().get(uri, null, (data) {
      if(data != null) {
        result = data;
      }
    }, (error){
      print('获取'+uri+'数据出错 ======> '+ error);
    });

  }
  
  ///返回结果总个数
  int getCount() => result.length;
}