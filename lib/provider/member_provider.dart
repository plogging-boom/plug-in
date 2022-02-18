import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:plug_in/data/service/member_service.dart';

import '../../data/model/member.dart';

class MemberProvider with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  MemberService _memberService = MemberService();

  Member? _member;

  get member => _member;

  bool auth() {
    User? user = _auth.currentUser;
    if (user != null) {
      print(user.email);
      return true;
    }
    return false;
  }

  signUp({required String email, required String password}) async {
    bool result = await _memberService.signUp(email: email, password: password);
    return result;
  }

  signIn({required String email, required String password}) async {
    UserCredential userCredential =
        await _memberService.signIn(email: email, password: password);
    _member = Member.toMember(userCredential.user!);
    notifyListeners();
  }

  logOut() async {
    await _memberService.logOut();
  }
}
