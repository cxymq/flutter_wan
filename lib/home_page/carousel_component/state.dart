import 'package:fish_redux/fish_redux.dart';

class CarouselState implements Cloneable<CarouselState> {

  @override
  CarouselState clone() {
    return CarouselState();
  }
}

CarouselState initState(Map<String, dynamic> args) {
  return CarouselState();
}
