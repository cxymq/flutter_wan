import 'package:fish_redux/fish_redux.dart';

class WebviewState implements Cloneable<WebviewState> {

  String url;
  String title;

  
  // WebViewState({
  // this.url,
  // this.title
  // });

  @override
  WebviewState clone() {
    return WebviewState()
    ..url
    ..title;
  }
}

WebviewState initState(Map<String, dynamic> args) {
  return WebviewState();
}
