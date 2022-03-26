import 'package:flutter/material.dart';
import 'package:plug_in/provider/trash_can_provider.dart';
import 'package:plug_in/provider/util_provider.dart';
import 'package:plug_in/ui/trash_can/trash_can_view.dart';
import 'package:provider/provider.dart';

import '../../provider/google_map_provider.dart';

class TrashCanPage extends StatelessWidget {
  const TrashCanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TrashCanProvider()),
        ChangeNotifierProvider(create: (context) => GoogleMapProvider()),
        ChangeNotifierProvider(create: (context) => UtilProvider()),
      ],
      child: TrashCanView(),
    );
  }
}
