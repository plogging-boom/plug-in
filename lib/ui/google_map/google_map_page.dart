import 'package:flutter/material.dart';
import 'package:plug_in/provider/google_map_provider.dart';
import 'package:plug_in/provider/member_provider.dart';
import 'package:plug_in/provider/util_provider.dart';
import 'package:provider/provider.dart';

import 'google_map_view.dart';

class GoogleMapPage extends StatelessWidget {
  const GoogleMapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MemberProvider()),
        ChangeNotifierProvider(create: (context) => GoogleMapProvider()),
        ChangeNotifierProvider(create: (context) => UtilProvider()),
      ],
      child: GoogleMapView(),
    );
  }
}
