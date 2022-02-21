import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:plug_in/provider/google_map_provider.dart';
import 'package:plug_in/provider/member_provider.dart';
import 'package:plug_in/ui/component/plug_in_container.dart';
import 'package:plug_in/ui/trash_can/trash_can_page.dart';
import 'package:provider/provider.dart';

class GoogleMapView extends StatelessWidget {
  Completer<GoogleMapController> _controller = Completer();

  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<GoogleMapProvider>(
      builder: (context, googleMapProvider, child) => Scaffold(
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
          ],
        ),
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: _goToTheLake,
        //   label: Text('To the lake!'),
        //   icon: Icon(Icons.directions_boat),
        // ),
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
}
