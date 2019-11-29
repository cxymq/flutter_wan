import 'dart:convert';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_wan/common/GlobalConfig.dart';
import 'package:flutter_wan/http/ResultCode.dart';

class DioManager {

  //单例
  static DioManager _instance;
  static DioManager getInstance() {
    if(_instance == null) {
      _instance = DioManager();
    }
    return _instance;
  }

  Dio dio = new Dio();
  DioManager() {
    dio.options.headers = {
      "version": "1.0.0",
      "Authorization": "token",
      // "contentType": "application/json;charset=UTF-8",
    };
    dio.options.baseUrl = "http://192.168.11.50:8014/";
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 3000;

    //网络请求日志开关
    dio.interceptors.add(LogInterceptor(responseBody: GlobalConfig.isDebug));
    //缓存
    dio.interceptors.add(CookieManager(CookieJar()));
  }

  get(dynamic url, Map<String, dynamic> params, Function successCallback, Function errorCallback) async {
    _requestURL(url, 'get', params, successCallback, errorCallback);
  }

  post(dynamic url, Map<String, dynamic> params, Function successCallback, Function errorCallback) async {
    _requestURL(url, 'post', params, successCallback, errorCallback);
  }

  //网络请求
  _requestURL(dynamic url,String method, Map<String, dynamic> params, Function successCallback, Function errorCallback) async {
    Response response;
    try {
      if(method == 'get') {
        if(url is String) {
          response = await dio.get(url);
        } else if(url is Uri) {
         response = await dio.getUri(url);
        }
      } 

      if(method == 'post') {
        if(url is String) {
          response = await dio.post(url, data: params);
        } else if(url is Uri) {
          response = await dio.postUri(url);
        }
      }

    } on DioError catch (e){
      Response errorResponse;
      if(e.response == null) {
        errorResponse = e.response;
      } else {
        errorResponse = new Response(statusCode: 0000);
      }

      if(e.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = ResultCode.CONNECT_TIMEOUT;
      } else if(e.type == DioErrorType.RECEIVE_TIMEOUT) {
        errorResponse.statusCode = ResultCode.RECEIVE_TIMEOUT;
      }

       // debug模式才打印
        if (GlobalConfig.isDebug) {
          print('请求异常: ' + e.toString());
          print('请求异常url: ' + url);
          print('请求头: ' + dio.options.headers.toString());
          print('method: ' + dio.options.method);
        }
    }
    // debug模式打印相关数据
      if (GlobalConfig.isDebug) {
        print('请求url: ' + url);
        print('请求头: ' + dio.options.headers.toString());
        if (params != null) {
          print('请求参数: ' + params.toString());
        }
        if (response != null) {
          print('返回参数: ' + response.toString());
        }
      }  

      String dataStr = json.encode(response.data);
      Map<String, dynamic> dataMap = json.decode(dataStr);
      if(dataMap == null || dataMap['state'] == 0) {
         _error(errorCallback, '错误码：' + dataMap['errorCode'].toString() + '，' + response.data.toString());
      } else {
        successCallback(dataMap);
      }
  }

   _error(Function errorCallBack, String error) {
    if (errorCallBack != null) {
      errorCallBack(error);
    }
  }
}