import 'package:flutter/material.dart';
import 'package:plug_in/data/model/route.dart';
import 'package:plug_in/provider/route_provider.dart';
import 'package:provider/provider.dart';

import '../component/plug_in_route_preview.dart';
import '../component/plug_in_container.dart';

class RouteDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 400.0,
          child: Consumer<RouteProvider>(
            builder: (context, route, child) => ListView.builder(
              itemCount: route.getRoutes.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        opaque: false,
                        transitionDuration: const Duration(milliseconds: 200),
                        reverseTransitionDuration:
                            const Duration(milliseconds: 200),
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return Scaffold(
                            backgroundColor: Colors.black12.withOpacity(0.6),
                            body: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: PlugInContainer(
                                height: 100.0,
                                child: Center(
                                  child: Text("hi"),
                                ),
                                color: Colors.purple,
                              ),
                            ),
                          );
                        },
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          const _begin = Offset(1.0, 0.0);
                          const _end = Offset.zero;
                          const _curve = Curves.ease;
                          final _tween = Tween(begin: _begin, end: _end)
                              .chain(CurveTween(curve: _curve));
                          return SlideTransition(
                            position: animation.drive(_tween),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: PlugInRoutePreview(
                      backGroundColor: Colors.blueGrey,
                      middleColor: Colors.blue),
                );
              },
            ),
          ),
        ),
        Consumer<RouteProvider>(
            builder: (BuildContext context, value, Widget? child) =>
                ElevatedButton(
                    onPressed: () {
                      PlugInRoute route = PlugInRoute(
                          imageUrl: "imageUrl",
                          distance: 3.5,
                          ploggingDate: "ploggingDate",
                          createdDate: "createdDate",
                          backgroundColor: "backgroundColor",
                          middleColor: "middleColor");
                      value.addRoute(route);
                    },
                    child: Text("Add"))),
      ],
    );
  }
}
