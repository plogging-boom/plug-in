import 'package:firebase_auth/firebase_auth.dart';
import 'package:plug_in/data/model/route.dart';

class Member {
  String _email;
  String _uid;
  String get uid => _uid;
  String get email => _email;

  Member({
    required String email,
    required String uid,
    List<PlugInRoute>? routes,
  })  : _email = email,
        _uid = uid;

  factory Member.toMember(User user) {
    return Member(email: user.email!, uid: user.uid);
  }
}
