import 'package:flutter/cupertino.dart';

import '../data/model/member_test.dart';

class MemberTestProvider with ChangeNotifier {
  MemberTest memberTest = MemberTest();

  MemberTest getMemberTest() => memberTest;

  void plogging() {
    memberTest.today += 1.2;
    memberTest.sum += 1.2;
    memberTest.avg += 0.5;
    notifyListeners();
  }
}
