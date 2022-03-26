import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plug_in/data/repository/route_repository.dart';

import '../model/route.dart';

class RouteService {
  RouteRepository _routeRepository;

  RouteService({required String email})
      : _routeRepository = RouteRepository(email: email);

  addRoute(PlugInRoute plugInRoute) async {
    await _routeRepository.addRoute(plugInRoute.toMap());
  }

  loadRoutes() async {
    List<PlugInRoute> routes = [];
    await _routeRepository.loadRoutes().then((value) => value.docs).then(
        (value) => value.forEach((element) =>
            routes.add(PlugInRoute.fromMap(element.data(), element.id))));
    return routes;
  }
}

class MemoService {
  final MemoRepository _memoRepository = MemoRepository();

  Future<DocumentReference> insertData(String value) async {
    DocumentReference doc =
        await _memoRepository.insertData(Memo(value: value));
    return doc;
  }

  Future<List<Memo>> readDatas() async {
    List<Memo> memoList = [];
    await _memoRepository.readData().then((value) => value.docs).then(
          (value) => value.forEach(
            (element) => memoList.add(
              Memo.fromMap(element.data(), element.id),
            ),
          ),
        );
    return memoList;
  }

  updateData(String text, String id) {
    _memoRepository.updateData(text, id);
  }
}
