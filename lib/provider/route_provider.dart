import 'package:flutter/material.dart';
import 'package:plug_in/data/model/route.dart';
import 'package:plug_in/data/service/route_service.dart';

//1
class RouteProvider with ChangeNotifier {
  // RouteService _routeService = RouteService(email: "dnddl8280@naver.com");
  final MemoService _MemoService = MemoService();

  List<Memo> list = [];
  // 동작 , 상태는 provider
  bool _isPressed = false;
  String _memoText = "Very Good";
  bool _savedPressed = false;
  String? _memoId;

  int clickCheckCount = 0;
  List<PlugInRoute> _routes = [];

  RouteProvider() {
    loadRoutes();
  }

  List<PlugInRoute> get getRoutes => _routes;

  bool get isPressed => _isPressed;
  String get memoText => _memoText;
  bool get savedPressed => _savedPressed;

  void onPressed() {
    _isPressed = true;
    notifyListeners();
  }

  void fillMemo(String content) {
    _memoText = content;
    notifyListeners();
  }

  addRoute(PlugInRoute route) {
    _routes.add(route);
    // _routeService.addRoute(route);
    notifyListeners();
  }

  loadRoutes() async {
    // _routes = await _routeService.loadRoutes();
    notifyListeners();
  }

  MemoProvider() {
    readDatas();
  }

  insertData(String value) async {
    await _MemoService.insertData(value).then(
      (value) {
        _memoId = value.id;
      },
    );
    print(_memoId);
    readDatas();
  }

  readDatas() async {
    list = await _MemoService.readDatas();
    notifyListeners();
  }

  updateData(String text) async {
    await _MemoService.updateData(text, _memoId!);
    readDatas();
    // TODO update
  }
}
