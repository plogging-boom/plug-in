import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MemberRepository {
  FirebaseAuth _auth = FirebaseAuth.instance;
  DocumentReference? _db;

  MemberRepository({String? email}) {
    if (email != null) {
      _db = FirebaseFirestore.instance.collection("member-info").doc(email);
    }
  }

  signUp({required String email, required String password}) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  signIn({required String email, required String password}) async {
    return await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  logOut() async {
    await _auth.signOut();
  }

  getMemberInfo() async {
    return await _db?.get();
  }
}
