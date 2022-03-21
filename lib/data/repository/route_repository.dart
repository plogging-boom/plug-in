import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plug_in/data/model/route.dart';

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
  // 전달 값 -> 'memo' : 'plugging success'
  // addMemo
}

class MemoRepository {
  final CollectionReference _db =
      FirebaseFirestore.instance.collection("PluggingMemo");
  // FIreStore DataBase 를 이용할때 기본 개념
  // CRUD (create -> read -> update -> delete)
  Future<DocumentReference> insertData(Memo memo) async {
    DocumentReference doc = await _db.add(memo.toMap());
    return doc;
  }

  readData() async {
    return await _db.get();
  }

  updateData(String text, String id) async {
    print(id);
    await _db.doc(id).update({'memo': text});
  }

  // Return type , Function Name , parameter, code
  deleteData(String id) async {
    await _db.doc(id).delete();
  }
}
