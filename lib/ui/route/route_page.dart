import 'package:flutter/material.dart';
import 'package:plug_in/provider/route_provider.dart';
import 'package:provider/provider.dart';
import '../../data/model/route_detail.dart';
import 'plug_in_route_detail.dart';

class RoutePage extends StatelessWidget {
  const RoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RouteProvider(),
      child: PlugInRouteDetail(
        routeDetail: RouteDetail(
            pluggingDistance: 3.5,
            pluggingTime: 1,
            pluggingMapImage: 'images/path.png',
            kcal: 235,
            userImageUrl: 'images/user1.png',
            memo: 'memo'),
      ),
    );
  }
}
