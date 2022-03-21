import 'package:flutter/material.dart';
import 'package:plug_in/provider/route_provider.dart';
import 'package:plug_in/ui/route/plug_in_route_detail_info.dart';
import 'package:provider/provider.dart';

import 'plug_in_route_detail.dart';

class RoutePage extends StatelessWidget {
  const RoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RouteProvider(),
      child: const PlugInRouteDetail(
        routeDetail: RouteDetail(
            pluggingDistance: 3.5,
            pluggingTime: 1,
            pluggingMapImage: 'images/pluggingRoute1.png',
            kcal: 235,
            userImageUrl: 'images/user1.jpg',
            memo: 'memo'),
      ),
    );
  }
}
