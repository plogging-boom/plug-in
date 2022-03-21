import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:plug_in/provider/google_map_provider.dart';
import 'package:plug_in/ui/component/plug_in_appbar.dart';
import 'package:plug_in/ui/component/plug_in_bottom_navigation_bar.dart';
import 'package:plug_in/ui/component/plug_in_container.dart';
import 'package:plug_in/ui/component/plug_in_drawer.dart';
import 'package:provider/provider.dart';

import '../trash_can/trash_can_page.dart';

class GoogleMapView extends StatelessWidget {
  Completer<GoogleMapController> _controller = Completer();

  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.4228962988735, -122.08427815399797),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<GoogleMapProvider>(
      builder: (context, googleMapProvider, child) => Scaffold(
        extendBodyBehindAppBar: true,
        endDrawer: PlugInDrawer(),
        appBar: PlugInAppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            GoogleMap(
              mapType: MapType.terrain,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            // Positioned(
            //   bottom: 10.0,
            //   right: 0,
            //   child: GestureDetector(
            //     onTap: () {
            //       Navigator.of(context).push(
            //         PageRouteBuilder(
            //           opaque: false,
            //           transitionDuration: const Duration(milliseconds: 300),
            //           reverseTransitionDuration:
            //               const Duration(milliseconds: 300),
            //           pageBuilder: (context, animation, secondaryAnimation) =>
            //               TrashCanPage(),
            //           transitionsBuilder:
            //               (context, animation, secondaryAnimation, child) {
            //             const _begin = Offset(1.0, 0.0);
            //             const _end = Offset.zero;
            //             const _curve = Curves.ease;
            //             final _tween = Tween(begin: _begin, end: _end)
            //                 .chain(CurveTween(curve: _curve));
            //             return SlideTransition(
            //               position: animation.drive(_tween),
            //               child: child,
            //             );
            //           },
            //         ),
            //       );
            //     },
            //     child: PlugInContainer(
            //       height: 70.0,
            //       width: 140.0,
            //       color: Colors.pink,
            //       child: Center(
            //         child: Text(
            //           "Add Trash Can!",
            //           style: TextStyle(color: Colors.white),
            //         ),
            //       ),
            //     ),
            //   ),
            // )
            Positioned(
              bottom: 0,
              child: googleMapProvider.isStart
                  ? _duringPloggingButton()
                  : _startPloggingButton(),
              // (조건식) ? 조건식이 참일때 실행할거 : 조건식이 거짓일때 실행할
            ),
            Positioned(
              bottom: 0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TrashCanPage()));
                },
                child: PlugInContainer(
                  height: 70.0,
                  width: 140.0,
                  color: Colors.pink,
                  child: Center(
                    child: Text("Add trashcan"),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: PlugInBottomNavigationBar(),
      ),
    );
  }

  // 반환할거 이름(매개변수) {}
  Widget _startPloggingButton() {
    return Consumer<GoogleMapProvider>(
      builder: (context, googleMapProvider, child) => GestureDetector(
        onTap: () {
          googleMapProvider.toggle();
        },
        child: PlugInContainer(
          height: 70.0,
          width: 140.0,
          color: Colors.green,
          child: Center(
            child: Text(
              "Start Plogging",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget _duringPloggingButton() {
    return Consumer<GoogleMapProvider>(
      builder: (context, googleMapProvider, child) => Column(
        children: [
          GestureDetector(
            onTap: () {
              googleMapProvider.toggle();
            },
            child: PlugInContainer(
              height: 70.0,
              width: 140.0,
              color: Colors.green,
              child: Center(
                child: Text(
                  "종료 Plogging",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: PlugInContainer(
              height: 70.0,
              width: 140.0,
              color: Colors.green,
              child: Center(
                child: Text(
                  "쉬기 Plogging",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future<Position> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }
}
