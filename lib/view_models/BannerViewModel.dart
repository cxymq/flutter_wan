import 'package:flutter_wan/view_models/BaseViewModel.dart';

class BannerViewModel extends BaseViewModel{
  
  void requestBanner(String uri) {
    requestResult(uri);
  }
}