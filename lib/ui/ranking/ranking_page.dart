import 'package:flutter/material.dart';
import 'package:plug_in/ui/ranking/ranking_view.dart';
import 'package:provider/provider.dart';

import '../../provider/util_provider.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UtilProvider()),
      ],
      child: RankingView(),
    );
  }
}
