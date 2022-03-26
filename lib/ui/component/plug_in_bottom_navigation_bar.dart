import 'package:flutter/material.dart';
import 'package:plug_in/provider/util_provider.dart';
import 'package:provider/provider.dart';

class PlugInBottomNavigationBar extends StatelessWidget {
  const PlugInBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UtilProvider>(
      builder: (context, utilProvider, child) => BottomNavigationBar(
        currentIndex: utilProvider.navIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Ranking"),
          BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: "Map"),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_outline), label: "Mypage"),
        ],
        onTap: (value) {
          utilProvider.setNavIndex(value.toInt());
        },
      ),
    );
  }
}
