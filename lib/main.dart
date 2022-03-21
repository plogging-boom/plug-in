import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:plug_in/ui/google_map/google_map_page.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GoogleMapPage(),
    );
  }
}

class TestMapPolyline extends StatefulWidget {
  @override
  _TestMapPolylineState createState() => _TestMapPolylineState();
}

class _TestMapPolylineState extends State<TestMapPolyline> {
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};

  late GoogleMapController controller;

  List<LatLng> latlngSegment1 = [];
  List<LatLng> latlngSegment2 = [];
  static LatLng _lat1 = LatLng(13.035606, 77.562381);
  static LatLng _lat2 = LatLng(13.070632, 77.693071);
  static LatLng _lat3 = LatLng(12.970387, 77.693621);
  static LatLng _lat4 = LatLng(12.858433, 77.575691);
  static LatLng _lat5 = LatLng(12.948029, 77.472936);
  static LatLng _lat6 = LatLng(13.069280, 77.455844);
  LatLng _lastMapPosition = _lat1;

  @override
  void initState() {
    super.initState();
    //line segment 1
    latlngSegment1.add(_lat1);
    latlngSegment1.add(_lat2);
    latlngSegment1.add(_lat3);
    latlngSegment1.add(_lat4);

    //line segment 2
    latlngSegment2.add(_lat4);
    latlngSegment2.add(_lat5);
    latlngSegment2.add(_lat6);
    latlngSegment2.add(_lat1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        //that needs a list<Polyline>
        polylines: _polyline,
        markers: _markers,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _lastMapPosition,
          zoom: 11.0,
        ),
        mapType: MapType.normal,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controllerParam) {
    setState(() {
      controller = controllerParam;
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        //_lastMapPosition is any coordinate which should be your default
        //position when map opens up
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Awesome Polyline tutorial',
          snippet: 'This is a snippet',
        ),
      ));

      _polyline.add(Polyline(
        polylineId: PolylineId('line1'),
        visible: true,
        //latlng is List<LatLng>
        points: latlngSegment1,
        width: 6,
        color: Colors.blue,
      ));

      //different sections of polyline can have different colors
      _polyline.add(Polyline(
        polylineId: PolylineId('line2'),
        visible: true,
        //latlng is List<LatLng>
        points: latlngSegment2,
        width: 2,
        color: Colors.red,
      ));
    });
  }
}

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//         create: (context) => GoogleMapProvider(),
//         child: Consumer<GoogleMapProvider>(
//             builder: (context, googleMapProvider, child) => Scaffold(
//                   appBar: AppBar(
//                     title: Text("hi"),
//                   ),
//                   body: Column(
//                     children: [
//                       Text(googleMapProvider.location),
//                       GestureDetector(
//                         onTap: () {
//                           googleMapProvider.startPlugIn();
//                         },
//                         child: PlugInContainer(
//                           color: Colors.green,
//                           height: 150,
//                           width: 150,
//                           child: Text("hihi"),
//                         ),
//                       )
//                     ],
//                   ),
//                 )));
//   }
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: ListView.builder(
//           itemCount: widget.routePreviews.length,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (BuildContext context, int index) {
//             return PlugInRoutePreview(
//                 routePreview: widget.routePreviews[index]);
//           },
//         ));
//   }
// }

// class _MyHomePageState extends State<MyHomePage> {
//   String _location = "On my location";
//
//   @override
//   void initState() {
//     super.initState();
//
//     ////
//     // 1.  Listen to events (See docs for all 12 available events).
//     //
//
//     // Fired whenever a location is recorded
//     bg.BackgroundGeolocation.onLocation((bg.Location location) {
//       setState(() {
//         _location = location.coords.latitude.toString() +
//             "|" +
//             location.coords.longitude.toString();
//       });
//       Fluttertoast.showToast(
//           msg: "[location] -  $location",
//           toastLength: Toast.LENGTH_SHORT,
//           //gravity: ToastGravity.CENTER,
//           //timeInSecForIosWeb: 1,
//           //backgroundColor: Colors.red,
//           //textColor: Colors.white,
//           fontSize: 16.0);
//       //print('[location] - $location');
//     });
//
//     // Fired whenever the plugin changes motion-state (stationary->moving and vice-versa)
//     bg.BackgroundGeolocation.onMotionChange((bg.Location location) {
//       setState(() {
//         _location = location.coords.latitude.toString() +
//             "|" +
//             location.coords.longitude.toString();
//       });
//       Fluttertoast.showToast(
//           msg: "[motiononchange] -  $location",
//           toastLength: Toast.LENGTH_SHORT,
//           //gravity: ToastGravity.CENTER,
//           //timeInSecForIosWeb: 1,
//           //backgroundColor: Colors.red,
//           //textColor: Colors.white,
//           fontSize: 16.0);
//       //print('[motionchange] - $location');
//     });
//
//     // Fired whenever the state of location-services changes.  Always fired at boot
//     bg.BackgroundGeolocation.onProviderChange((bg.ProviderChangeEvent event) {
//       Fluttertoast.showToast(
//           msg: "[providerchange] -  $event",
//           toastLength: Toast.LENGTH_SHORT,
//           //gravity: ToastGravity.CENTER,
//           //timeInSecForIosWeb: 1,
//           //backgroundColor: Colors.red,
//           //textColor: Colors.white,
//           fontSize: 16.0);
//       //print('[providerchange] - $event');
//     });
//
//     ////
//     // 2.  Configure the plugin
//     //
//     bg.BackgroundGeolocation.ready(bg.Config(
//             notification:
//                 bg.Notification(title: "name App", text: "location activate"),
//             desiredAccuracy: bg.Config.DESIRED_ACCURACY_HIGH,
//             distanceFilter: 10.0,
//             stopOnTerminate: true,
//             startOnBoot: true,
//             debug: true,
//             logLevel: bg.Config.LOG_LEVEL_VERBOSE))
//         .then((bg.State state) {
//       if (!state.enabled) {
//         ////
//         // 3.  Start the plugin.
//         //
//         bg.BackgroundGeolocation.start();
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Center(
//                 child: Text(_location, style: TextStyle(fontSize: 30.0)),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
