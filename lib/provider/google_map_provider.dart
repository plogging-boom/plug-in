import 'package:flutter/cupertino.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart';

class GoogleMapProvider with ChangeNotifier {
  bool _isStart = false;

  get isStart => _isStart;

  void toggle() {
    _isStart = !_isStart;
    notifyListeners();
  }

  void test() {
    BackgroundGeolocation.locations;
  }
}
