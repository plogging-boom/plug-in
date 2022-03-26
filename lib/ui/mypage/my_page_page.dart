import 'package:flutter/material.dart';
import 'package:plug_in/ui/mypage/my_page_view.dart';
import 'package:provider/provider.dart';

import '../../provider/member_provider.dart';
import '../../provider/util_provider.dart';

class MyPagePage extends StatelessWidget {
  const MyPagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MemberProvider()),
        ChangeNotifierProvider(create: (context) => UtilProvider()),
      ],
      child: MyPageView(),
    );
  }
}
