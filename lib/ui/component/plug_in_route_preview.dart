import 'package:flutter/material.dart';
import 'package:plug_in/ui/component/plug_in_container.dart';

import '../../data/model/route_preview.dart';

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
      alignment: AlignmentDirectional.topCenter,
      children: [
        PlugInContainer(
            height: 250,
            width: 220,
            useShadow: false,
            child: Image.asset(routePreview.imageUrl),
            color: routePreview.backgroundColor),
        Positioned(
          bottom: 0,
          child: PlugInContainer(
              useShadow: false,
              height: 105,
              width: 160,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      routePreview.distance.toString() + "km",
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
        // Positioned(
        //   bottom: 0,
        //   child: PlugInContainer(
        //       height: 50,
        //       width: 50,
        //       useShadow: false,
        //       child: const Icon(
        //         Icons.arrow_forward_ios_rounded,
        //         color: Colors.white,
        //       ),
        //       color: routePreview.backgroundColor),
        // )
      ],
    );
  }
}
