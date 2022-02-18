import 'package:flutter/material.dart';
import 'package:plug_in/plug_in_container.dart';
import 'package:plug_in/plug_in_route_info.dart';

class PlugInRoutePreview extends StatelessWidget {
  final RoutePreview routePreview;

  final int baseTop = 0;
  const PlugInRoutePreview({
    Key? key,
    required this.routePreview,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.center,
      children: [
        PlugInContainer(
            height: 300,
            width: 230,
            useShadow: false,
            child: Text(routePreview.imageUrl),
            color: routePreview.backgroundColor),
        Positioned(
          top: baseTop.toDouble() + 450,
          child: PlugInContainer(
              height: 105,
              width: 160,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      routePreview.distance.toString(),
                      style: TextStyle(
                          color: routePreview.backgroundColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      routePreview.date,
                      style: TextStyle(
                          color: routePreview.backgroundColor, fontSize: 15),
                    )
                  ],
                ),
              ),
              color: routePreview.middleColor),
        ),
        Positioned(
          top: baseTop.toDouble() + 530,
          child: PlugInContainer(
              height: 50,
              width: 50,
              useShadow: false,
              child: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
              ),
              color: routePreview.backgroundColor),
        )
      ],
    );
  }
}
