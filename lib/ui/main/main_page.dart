import 'package:flutter/material.dart';
import 'package:plug_in/provider/member_provider.dart';
import 'package:plug_in/provider/route_provider.dart';
import 'package:provider/provider.dart';

import '../../provider/member_test_provider.dart';
import 'main_view.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MemberTestProvider()),
        ChangeNotifierProvider(create: (context) => MemberProvider()),
        ChangeNotifierProvider(create: (context) => RouteProvider()),
      ],
      child: MainView(),
    );
  }
}
