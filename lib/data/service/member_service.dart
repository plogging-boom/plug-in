import 'package:firebase_auth/firebase_auth.dart';
import 'package:plug_in/data/repository/member_repository.dart';

class MemberService {
  static MemberRepository _memberRepository = MemberRepository();

  signUp({required String email, required String password}) async {
    try {
      await _memberRepository.signUp(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    } catch (e) {
      print(e.toString());
    }
    return false;
  }

  signIn({required String email, required String password}) async {
    try {
      return await _memberRepository.signIn(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  logOut() async {
    await _memberRepository.logOut();
  }
}
