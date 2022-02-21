import 'package:flutter/cupertino.dart';

class GoogleMapProvider with ChangeNotifier {
  bool _isStart = false;

  get isStart => _isStart;

  void toggle() {
    _isStart = !_isStart;
    notifyListeners();
  }
}
