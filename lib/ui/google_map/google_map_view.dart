import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:plug_in/plug_in_container.dart';
import 'package:plug_in/provider/google_map_provider.dart';
import 'package:provider/provider.dart';

class GoogleMapView extends StatelessWidget {
  final Completer<GoogleMapController> _controller = Completer();

  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(35.13496209240095, 129.10102363271136),
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<GoogleMapProvider>(
      builder: (context, googleMapProvider, child) => Scaffold(
        body: Stack(children: [
          GoogleMap(
            mapType: MapType.normal,
            polylines: Set.from(googleMapProvider.polyLine),
            markers: Set.from(googleMapProvider.markers),
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          googleMapProvider.isStartButton ? startButton() : duringButton(),
        ]),
      ),
    );
  }

  Widget startButton() {
    return Consumer<GoogleMapProvider>(
      builder: (context, googleMapProvider, child) => Positioned(
        bottom: 105,
        left: 310,
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
              color: Color(0xff2BC346)),
        ),
      ),
    );
  }

  Widget duringButton() {
    return Consumer<GoogleMapProvider>(
      builder: (context, googleMapProvider, child) => Positioned(
        bottom: 105,
        left: 310,
        child: Center(
          child: Column(children: [
            GestureDetector(
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
                    size: 50,
                    color: Colors.white,
                  ),
                  color: googleMapProvider.isRestartButton
                      ? Color(0xffFFB800)
                      : Color(0xff2BC346)),
            ),
            SizedBox(
              width: 60,
            ),
            GestureDetector(
              onTap: () {
                googleMapProvider.stopPlugIn();
              },
              child: const PlugInContainer(
                  useShadow: false,
                  height: 60,
                  width: 60,
                  child: Icon(
                    Icons.stop,
                    size: 40,
                    color: Colors.white,
                  ),
                  color: Color(0xffFF1049)),
            ),
          ]),
        ),
      ),
    );
  }
}
