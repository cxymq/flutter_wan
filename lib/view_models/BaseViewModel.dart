///基类

abstract class BaseViewModel {
  ///存放网络请求的结果
  List result = List();

  void requestResult(String uri, Function successCallback, Function errorCallback);
  
  ///返回结果总个数
  int getCount();
}