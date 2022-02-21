import 'package:flutter/material.dart';
import 'package:plug_in/provider/member_provider.dart';
import 'package:plug_in/ui/component/plug_in_container.dart';
import 'package:provider/provider.dart';

//1
class MemberView extends StatelessWidget {
  const MemberView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlugInContainer(
      height: 150.0,
      color: Colors.blueGrey,
      child: Consumer<MemberProvider>(
        builder: (context, member, child) => Row(
          children: [
            FloatingActionButton(
              child: Text("가입"),
              onPressed: () {
                member.signUp(
                    email: "dnddl8280@naver.com", password: "woong12345");
              },
            ),
            FloatingActionButton(
              child: Text("로긘"),
              onPressed: () {
                member.signIn(
                    email: "dnddl8280@naver.com", password: "woong12345");
              },
            ),
            FloatingActionButton(
              child: Text("Auth"),
              onPressed: () {
                print(member.auth());
              },
            ),
            FloatingActionButton(
              child: Text("로그아웃"),
              onPressed: () {
                print(member.logOut());
              },
            ),
          ],
        ),
      ),
    );
  }
}
