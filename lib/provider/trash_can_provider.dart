import 'dart:io';

import 'package:flutter/material.dart';

class TrashCanProvider with ChangeNotifier {
  File? _image;
  bool _btn = false;
  String _checkComment = "";

  File? get image => _image;
  bool get btn => _btn;
  String get checkComment => _checkComment;

  void toggleBtn() {
    _btn = !btn;
    notifyListeners();
  }

  setImage(String path) {
    _image = File(path);
    notifyListeners();
  }

  check() {
    _checkComment = "TrashCan!!!";
    notifyListeners();
  }
}
