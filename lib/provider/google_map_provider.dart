import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
    as bg;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeoLocatorService with ChangeNotifier {
  Future<Position> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    return position;
  }
}

class GoogleMapProvider with ChangeNotifier {
  bool _isStartButton = true;
  bool _isRestartButton = true;
  List<Marker> _markers = [];
  List<Polyline> _polyline = [];
  List<LatLng> _latlngs = [];
  GeoLocatorService _geoLocatorService = GeoLocatorService();
  String _location = "On my location";
  List<List<LatLng>> points = [
    [
      LatLng(35.133753152800395, 129.1041732928728),
      LatLng(35.13383401295951, 129.10399763456215),
      LatLng(35.13381168938658, 129.10341908273261),
      LatLng(35.13354846440331, 129.1030864888273),
      LatLng(35.13354846440331, 129.1030864888273),
      LatLng(35.133091882876016, 129.10160631820895),
      LatLng(35.13299536629437, 129.10126299546806),
      LatLng(35.133530593168864, 129.1011878936185),
      LatLng(35.134013171760834, 129.1011127917689),
      LatLng(35.13501341646135, 129.1009518592341),
      LatLng(35.135732883121335, 129.1008660285489),
      LatLng(35.136206674766825, 129.10074801135673),
      LatLng(35.136417247946454, 129.10071582484974),
      LatLng(35.136770849947446, 129.10046675885243),
      LatLng(35.137235679566686, 129.10027390699108),
      LatLng(35.13752054770876, 129.10086882179647),
      LatLng(35.13776062328572, 129.10118792269049),
      LatLng(35.137976804604754, 129.1017793920576),
      LatLng(35.13807812156771, 129.10203652121618),
    ],
    [
      LatLng(35.13015218146219, 129.09729209392668),
      LatLng(35.13019741281299, 129.0922703631651),
      LatLng(35.129211363669775, 129.09262431775625),
      LatLng(35.12839718565328, 129.09453788476452),
      LatLng(35.12775488391887, 129.0950798777322),
      LatLng(35.12664926835374, 129.0955355164477),
      LatLng(35.12508786609229, 129.09862849162076),
      LatLng(35.12513628208175, 129.10004918868756),
      LatLng(35.12743601005543, 129.10178066282748),
      LatLng(35.12793225862616, 129.1009075262954),
      LatLng(35.12815012289716, 129.10092232521967),
      LatLng(35.13015928814619, 129.0972817898485),
    ],
    [
      LatLng(35.12939893842463, 129.1062159146455),
      LatLng(35.129745667265574, 129.10625238347615),
      LatLng(35.12993580826126, 129.10632987974128),
      LatLng(35.130169715627964, 129.1064744736158),
      LatLng(35.13037072021553, 129.10661970323378),
      LatLng(35.13015835349272, 129.10663451833614),
      LatLng(35.13025473605729, 129.10695541991598),
      LatLng(35.130401428952005, 129.10708151901576),
      LatLng(35.130531775547766, 129.10719490957237),
      LatLng(35.13070076113607, 129.10727519011496),
      LatLng(35.13089127312969, 129.1073567867231),
      LatLng(35.13112160906959, 129.1075765711344),
      LatLng(35.131253998124514, 129.10775818939555),
      LatLng(35.13139279555841, 129.10795480043433),
      LatLng(35.131576847961526, 129.10805482208244),
      LatLng(35.13169954933449, 129.10810088468568),
      LatLng(35.131888982667114, 129.10824565286023),
      LatLng(35.13209886567994, 129.10850360344566),
      LatLng(35.132258161137614, 129.10870101459057),
      LatLng(35.132400235201764, 129.10881946127753),
    ],
  ];

  List<LatLng> testPoints = [
    LatLng(35.133682700701776, 129.0962467935405),
    LatLng(35.133629352530264, 129.09625005672277),
    LatLng(35.13355462973363, 129.09625658308727),
    LatLng(35.13353861769687, 129.09614563489072),
    LatLng(35.1335439550428, 129.0960836344279),
    LatLng(35.13352260565696, 129.09596615986683),
    LatLng(35.133535949023766, 129.09590415940406),
    LatLng(35.133527943003934, 129.09578668484298),
    LatLng(35.13351193096191, 129.0956626839174),
    LatLng(35.13348669882078, 129.09553260172575),
    LatLng(35.133485303815455, 129.0954456072418),
    LatLng(35.13349227884179, 129.09533643769328),
    LatLng(35.13348948883134, 129.0952528547577),
    LatLng(35.13348251380477, 129.09515903717693),
    LatLng(35.13348111879937, 129.09504645608),
    LatLng(35.133456008698595, 129.0949338749494),
    LatLng(35.13344903366917, 129.09483835159446),
    LatLng(35.133456008698595, 129.094695066562),
  ];

  List<LatLng> trashPoints = [
    LatLng(35.134542093426376, 129.1038118882359),
    LatLng(35.131879509528375, 129.09694445021015),
    LatLng(35.13482035590665, 129.1037122056775),
    LatLng(35.13144645606319, 129.10810943932123),
  ];

  List<Color> colors = [
    Colors.green.shade600,
    Colors.lime.shade600,
    Colors.lightGreen.shade600,
  ];

  late BitmapDescriptor startMarker;
  late BitmapDescriptor stopMarker;
  late BitmapDescriptor trashMarker;

  void setMarkers() async {
    startMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), "images/001.png");
    stopMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), "images/002.png");
    trashMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), "images/003.png");
    for (int i = 0; i < trashPoints.length; i++) {
      addMarker(trashPoints[i].latitude, trashPoints[i].longitude,
          BitmapDescriptor.defaultMarker);
    }
  }

  GoogleMapProvider() {
    setMarkers();
    for (int i = 0; i < points.length; i++) {
      _polyline.add(
        Polyline(
          polylineId: PolylineId(i.toString()),
          visible: true,
          //latlng is List<LatLng>
          points: points[i],
          width: 6,
          color: colors[i],
        ),
      );
    }
  }

  bool get isStartButton => _isStartButton;
  bool get isRestartButton => _isRestartButton;
  List<Marker> get markers => _markers;
  String get location => _location;
  List<Polyline> get polyLine => _polyline;

  // void getCurrentLocation() {
  //   _geoLocatorService
  //       .getCurrentLocation()
  //       .then((value) => addMarker(value.latitude, value.longitude));
  // }

  void pauseAndRestart() {
    _isRestartButton = !_isRestartButton;
    _isRestartButton
        ? bg.BackgroundGeolocation.start()
        : bg.BackgroundGeolocation.stop();

    notifyListeners();
  }

  void stopPlugIn() {
    _isStartButton = true;
    _isRestartButton = true;
    // bg.BackgroundGeolocation.stop();
    //_markers.clear();
    addLatLng(35.13344903366917, 129.0946524222071);
    addMarker(35.13344903366917, 129.0946524222071, stopMarker);
    notifyListeners();
  }

  void addMarker(double latitude, double longitude, BitmapDescriptor icon) {
    _markers.add(
      Marker(
        markerId: MarkerId(_markers.length.toString()),
        position: LatLng(latitude, longitude),
        icon: icon,
      ), //position.latitude   position.longitude
    );
  }

  void addLatLng(double latitude, double longitude) {
    _latlngs.add(LatLng(latitude, longitude));
    addPolyLine();
  }

  void addPolyLine() {
    _polyline.add(
      Polyline(
        polylineId: PolylineId("juwon"),
        visible: true,
        //latlng is List<LatLng>
        points: _latlngs,
        width: 6,
        color: Colors.green.shade600,
      ),
    );
    notifyListeners();
  }

  void startPlugIn() {
    _isStartButton = !_isStartButton;

    addMarker(35.133682700701776, 129.0962467935405, startMarker);
    Stream.periodic(Duration(seconds: 3), (int x) => x).take(18).listen(
      (int x) {
        print(testPoints[x]);
        addLatLng(testPoints[x].latitude, testPoints[x].longitude);
      },
    );
    notifyListeners();

    // bg.BackgroundGeolocation.onLocation((bg.Location location) {
    //   // addMarker(location.coords.latitude, location.coords.longitude);
    //   addLatLng(location.coords.latitude, location.coords.longitude);
    //   notifyListeners();
    // });
    // bg.BackgroundGeolocation.onMotionChange((bg.Location location) {
    //   // addMarker(location.coords.latitude, location.coords.longitude);
    //   addLatLng(location.coords.latitude, location.coords.longitude);
    //   notifyListeners();
    // });
    // bg.BackgroundGeolocation.onProviderChange(
    //     (bg.ProviderChangeEvent event) {});
    // bg.BackgroundGeolocation.ready(bg.Config(
    //         notification:
    //             bg.Notification(title: "name App", text: "location activate"),
    //         desiredAccuracy: bg.Config.DESIRED_ACCURACY_HIGH,
    //         distanceFilter: 10.0,
    //         stopOnTerminate: false,
    //         startOnBoot: true,
    //         debug: true,
    //         logLevel: bg.Config.LOG_LEVEL_VERBOSE))
    //     .then((bg.State state) {
    //   if (!state.enabled) {
    //     ////
    //     // 3.  Start the plugin.
    //     //
    //     bg.BackgroundGeolocation.start();
    //   }
    // });
  }
}
