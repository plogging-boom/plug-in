import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:plug_in/data/service/member_service.dart';

import '../../data/model/member.dart';

class MemberProvider with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  MemberService _memberService = MemberService();

  Member? _member = Member(
    email: "dohun31@naver.com",
    uid: "dasdfa",
    address: "hi",
    sum: 1.2,
    avg: 1.2,
    today: 1.2,
    weight: 35.0,
    name: "Baek Dohun",
  );
  bool _selectLogin = false;

  Member get member => _member!;
  get selectLogin => _selectLogin;

  void toggle() {
    _selectLogin = !_selectLogin;
    notifyListeners();
  }

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
    User user = userCredential.user!;
    Map<String, dynamic>? map = await _memberService.getMemberInfo(user.email!);
    print(map);
    _member = Member.toMember(user, map!);
    notifyListeners();
  }

  logOut() async {
    await _memberService.logOut();
  }
}
