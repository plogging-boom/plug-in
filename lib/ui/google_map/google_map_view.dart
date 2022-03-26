import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:plug_in/provider/google_map_provider.dart';
import 'package:plug_in/provider/util_provider.dart';
import 'package:plug_in/ui/trash_can/trash_can_page.dart';
import 'package:provider/provider.dart';

import '../component/plug_in_container.dart';

class GoogleMapView extends StatelessWidget {
  final Completer<GoogleMapController> _controller = Completer();

  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(35.13496209240095, 129.10102363271136),
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<GoogleMapProvider>(
      builder: (context, googleMapProvider, child) => Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            polylines: Set.from(googleMapProvider.polyLine),
            markers: Set.from(googleMapProvider.markers),
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          trashCanButton(),
          googleMapProvider.isStartButton ? startButton() : duringButton(),
        ],
      ),
    );
  }

  Widget trashCanButton() {
    return Consumer<UtilProvider>(
      builder: (context, utilProvider, child) => Positioned(
        bottom: 65,
        right: 0,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                opaque: false,
                transitionDuration: const Duration(milliseconds: 200),
                reverseTransitionDuration: const Duration(milliseconds: 200),
                pageBuilder: (context, animation, secondaryAnimation) {
                  return Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.transparent,
                    ),
                    backgroundColor: Colors.black12.withOpacity(0.9),
                    body: TrashCanPage(),
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
          child: const PlugInContainer(
            useShadow: false,
            height: 60,
            width: 60,
            child: Icon(
              Icons.delete,
              size: 30,
              color: Colors.white,
            ),
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget startButton() {
    return Consumer<GoogleMapProvider>(
      builder: (context, googleMapProvider, child) => Positioned(
        bottom: 130,
        right: 0,
        child: GestureDetector(
          onTap: () {
            googleMapProvider.startPlugIn();
          },
          child: const PlugInContainer(
            useShadow: false,
            height: 60,
            width: 60,
            child: Icon(
              Icons.arrow_right,
              size: 50,
              color: Colors.white,
            ),
            color: Color(0xff2BC346),
          ),
        ),
      ),
    );
  }

  Widget duringButton() {
    return Consumer<GoogleMapProvider>(
      builder: (context, googleMapProvider, child) => Stack(
        children: [
          Positioned(
            bottom: 195,
            right: 0,
            child: GestureDetector(
              onTap: () {
                googleMapProvider.pauseAndRestart();
              },
              child: PlugInContainer(
                useShadow: false,
                height: 60,
                width: 60,
                child: Icon(
                  googleMapProvider.isRestartButton
                      ? Icons.pause
                      : Icons.arrow_right,
                  size: 30,
                  color: Colors.white,
                ),
                color: googleMapProvider.isRestartButton
                    ? Color(0xffFFB800)
                    : Color(0xff2BC346),
              ),
            ),
          ),
          Positioned(
            bottom: 130,
            right: 0,
            child: GestureDetector(
              onTap: () {
                googleMapProvider.stopPlugIn();
              },
              child: const PlugInContainer(
                useShadow: false,
                height: 60,
                width: 60,
                child: Icon(
                  Icons.stop,
                  size: 30,
                  color: Colors.white,
                ),
                color: Color(0xffFF1049),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
