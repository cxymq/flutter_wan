
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_wan/http/DioManager.dart';
import 'package:flutter_wan/http/WanHttpRequest.dart';

void main() {
  test('测试封装的Dio网络请求',(){

    DioManager.getInstance().get('http://wanandroid.com/article/listproject/0/json', null, 
    (data) {
      if(data != null) {
         print("00000000");
         print(data['errorCode']);
         expect(data['errorCode'], 0);
        
      }
      
    }, (error) {
      print("error" + error);
      
    });
    
  });

  test('测试Dio', () async {
    Response res = await Dio().get('http://www.wanandroid.com/banner/json');
    if(res != null) {
      print(res);
    }
  });

}