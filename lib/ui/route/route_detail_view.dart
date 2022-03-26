import 'package:flutter/material.dart';
import 'package:plug_in/data/model/route.dart';
import 'package:plug_in/provider/route_provider.dart';
import 'package:provider/provider.dart';

import '../component/plug_in_container.dart';

class RouteDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlugInContainer(
      height: 300.0,
      color: Colors.red,
      child: Consumer<RouteProvider>(
        builder: (context, route, child) => Column(
          children: [
            FloatingActionButton(
              onPressed: () {
                route.addRoute(
                  PlugInRoute(
                    imageUrl: "du",
                    distance: 5.0,
                    ploggingDate: "ploggingDate",
                    createdDate: "createdDate",
                    backgroundColor: "backgroundColor",
                    middleColor: "middleColor",
                  ),
                );
              },
            ),
            FloatingActionButton(
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
