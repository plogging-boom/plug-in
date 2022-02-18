import 'package:firebase_auth/firebase_auth.dart';

import '../model/member.dart';

class MemberRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
}
