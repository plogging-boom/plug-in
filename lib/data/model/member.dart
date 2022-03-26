import 'package:firebase_auth/firebase_auth.dart';

class Member {
  String _uid;
  String _name;
  String _address;
  double _sum;
  double _today;
  double _avg;
  String _email;
  double _weight = 35.0;

  String get uid => _uid;
  String get name => _name;
  String get email => _email;
  String get address => _address;
  double get sum => _sum;
  double get today => _today;
  double get avg => _avg;
  String get meail => _email;
  double get weight => _weight;

  set today(double distance) {
    _today += distance;
  }

  Member(
      {required String email,
      required String uid,
      required String address,
      required double sum,
      required double avg,
      required double weight,
      required String name,
      required double today})
      : _email = email,
        _uid = uid,
        _address = address,
        _sum = sum,
        _avg = avg,
        _weight = weight,
        _name = name,
        _today = today;

  factory Member.toMember(User user, Map<String, dynamic> map) {
    return Member(
      email: user.email!,
      uid: user.uid,
      address: map["address"],
      sum: map["sum"],
      avg: map["avg"],
      weight: map["weight"],
      today: map["today"],
      name: map["name"],
    );
  }
}
