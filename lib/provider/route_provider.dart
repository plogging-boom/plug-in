import 'package:flutter/material.dart';
import 'package:plug_in/data/model/route.dart';
import 'package:plug_in/data/service/route_service.dart';

class RouteProvider with ChangeNotifier {
  List<PlugInRoute> _routes = [];
  RouteService _routeService = RouteService(email: "dohun31@naver.com");

  RouteProvider() {
    loadRoutes();
  }

  List<PlugInRoute> get getRoutes => _routes;

  addRoute(PlugInRoute route) {
    _routes.add(route);
    _routeService.addRoute(route);
    notifyListeners();
  }

  loadRoutes() async {
    _routes = await _routeService.loadRoutes();
    // _routes.forEach((element) => print(element.rid));
    notifyListeners();
  }
}
