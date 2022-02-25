import 'package:flutter/material.dart';

class UtilProvider with ChangeNotifier {
  bool _canSeeDetail = false;
  Color _themeColor = Colors.lightGreen;
  int _drawerIndex = 0;
  late List<DrawerTile> _drawerList;

  UtilProvider() {
    _drawerList = [
      DrawerTile(
        title: "Main Page",
        icon: Icon(Icons.home_max_outlined),
        pageRoute: "/",
      ),
      DrawerTile(
        title: "My Page",
        icon: Icon(Icons.settings),
        pageRoute: "/route",
      ),
      DrawerTile(
        title: "Go Plogging",
        icon: Icon(Icons.run_circle_outlined),
        pageRoute: "/google-map",
      ),
      DrawerTile(
        title: "Update Trashcan",
        icon: Icon(Icons.restore_from_trash_outlined),
        pageRoute: "/trash",
      ),
    ];
  }

  bool get canSeeDetail => _canSeeDetail;
  Color get themeColor => _themeColor;
  List<DrawerTile> get drawerList => _drawerList;
  int get drawerIndex => _drawerIndex;

  void toggleDetailButton() {
    _canSeeDetail = !_canSeeDetail;
    notifyListeners();
  }

  void changeSelectIndex(int index) {
    _drawerIndex = index;
    notifyListeners();
  }
}

class DrawerTile {
  final String _title;
  final Icon _icon;
  final String _pageRoute;

  DrawerTile(
      {required String title, required Icon icon, required String pageRoute})
      : _title = title,
        _icon = icon,
        _pageRoute = pageRoute;

  String get title => _title;
  Icon get icon => _icon;
  String get pageRoute => _pageRoute;
}
