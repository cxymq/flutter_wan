class ResultCode {
   //正常返回是1
  static const SUCCESS = 1;
  
  //异常返回是0
  static const ERROR = 0;
  
  /// 超时
  static const CONNECT_TIMEOUT = -1;

  ///服务器错误
  static const RECEIVE_TIMEOUT = -2;

  /// 服务器返回不正确的状态码, 如 404, 503...
  static const RESPONSE = -3;
  /// 请求取消
  static const CANCEL = -4;

  /// DioError.error不为空.
  static const DEFAULT = -5;
}