import 'package:flutter/material.dart';

class PlugInBottomNavigationBar extends StatelessWidget {
  const PlugInBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 1,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.star), label: "Ranking"),
        BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: "Map"),
        BottomNavigationBarItem(
            icon: Icon(Icons.people_outline), label: "Mypage"),
      ],
      onTap: (value) {
        print(value);
      },
    );
  }
}
