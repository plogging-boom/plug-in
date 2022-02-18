import 'package:flutter/material.dart';
import 'package:plug_in/provider/route_provider.dart';
import 'package:plug_in/ui/route/route_detail_view.dart';
import 'package:provider/provider.dart';

class RoutePage extends StatelessWidget {
  const RoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RouteProvider(),
      child: RouteDetailView(),
    );
    ;
  }
}
