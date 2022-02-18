import 'package:flutter/material.dart';
import 'package:plug_in/provider/member_provider.dart';
import 'package:provider/provider.dart';

import 'member_view.dart';

class MemberPage extends StatelessWidget {
  const MemberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MemberProvider(),
      child: MemberView(),
    );
  }
}
