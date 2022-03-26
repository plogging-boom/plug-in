import 'package:flutter/material.dart';
import 'package:plug_in/ui/google_map/google_map_page.dart';
import 'package:plug_in/ui/mypage/my_page_page.dart';

import '../ui/ranking/ranking_page.dart';
import '../ui/trash_can/trash_can_page.dart';

class UtilProvider with ChangeNotifier {
  int _navIndex = 1;
  List<Widget> _children = [
    RankingPage(),
    GoogleMapPage(),
    MyPagePage(),
  ];

  int get navIndex => _navIndex;
  Widget get children => _children[_navIndex];

  void setNavIndex(int navIndex) {
    _navIndex = navIndex;
    notifyListeners();
  }
}

// class DrawerTile {
//   final String _title;
//   final Icon _icon;
//   final String _pageRoute;
//
//   DrawerTile(
//       {required String title, required Icon icon, required String pageRoute})
//       : _title = title,
//         _icon = icon,
//         _pageRoute = pageRoute;
//
//   String get title => _title;
//   Icon get icon => _icon;
//   String get pageRoute => _pageRoute;
// }
