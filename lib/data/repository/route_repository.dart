import 'package:cloud_firestore/cloud_firestore.dart';

class RouteRepository {
  CollectionReference _myRoutes;

  RouteRepository({required String email})
      : _myRoutes = FirebaseFirestore.instance
            .collection("member-info")
            .doc(email)
            .collection("my-routes");

  addRoute(Map map) async {
    await _myRoutes.add(map);
  }

  loadRoutes() async {
    return await _myRoutes.get();
  }

  loadRouteByRid(String rid) async {
    return await _myRoutes.doc(rid).get();
  }
}
