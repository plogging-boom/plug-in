import 'package:flutter/material.dart';
import 'package:plug_in/data/model/route_preview.dart';

import '../component/plug_in_route_preview.dart';
import '../route/route_page.dart';

class MyPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ListTile(
          title: UserAccountsDrawerHeader(
            currentAccountPicture: Image.asset("images/user1.png"),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.lightGreen,
            ),
            margin: EdgeInsets.zero,
            accountName: Text(
              "Back Dohun",
              style: TextStyle(fontSize: 20.0),
            ),
            accountEmail: Text("email@email.com"),
            onDetailsPressed: () {},
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     Image.network(
        //       'https://www.kindpng.com/picc/m/32-329306_hamdan-azhar-emoji-with-beard-and-glasses-hd.png',
        //       width: 200,
        //       height: 250,
        //     ),
        //     Text(
        //       "최현웅",
        //       style: TextStyle(fontSize: 50),
        //     ),
        //   ],
        // ),
        // Text(
        //   "Today",
        //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        // ),
        // Text(
        //   "3.2km",
        //   style: TextStyle(fontSize: 60, color: Colors.lightGreen),
        // ),
        // Text(
        //   "Total",
        //   style:
        //       TextStyle(fontSize: 20, fontWeight: FontWeight.bold, height: 3),
        // ),
        // Text(
        //   "31.2km",
        //   style: TextStyle(fontSize: 60, color: Colors.lightGreen),
        // ),
        // Text(
        //   "My Routes",
        //   style:
        //       TextStyle(fontSize: 20, fontWeight: FontWeight.bold, height: 3),
        // ),
        // // Image.network(
        // //   'https://postfiles.pstatic.net/MjAyMjAzMjFfMjEw/MDAxNjQ3ODc0MzEwNzE4.8Rm78nE_Df6io33Xp28n4k7cyPNbmcRLnTVxECV8G4sg.uUmwW2NeZBJL0fmW-yOv243l8BrhB8UF8pQ1koc2MBQg.PNG.jojh0323/Screen_Shot_2022-03-21_at_11.20.17_PM.png?type=w773',
        // // )
        ListTile(
          leading: Icon(Icons.today),
          title: Text("Today"),
          trailing: Text("3.2km"),
        ),
        ListTile(
          leading: Icon(Icons.directions_run_outlined),
          title: Text("Total"),
          trailing: Text("31.2km"),
        ),
        ListTile(
          leading: Icon(Icons.star),
          title: Text("Ranking"),
          trailing: Text("31"),
        ),
        ListTile(
          title: Text("My Routes"),
        ),
        Expanded(child: _routePreviewListView(context))
      ],
    );
  }

  Widget _routePreviewListView(BuildContext context) {
    List<RoutePreview> routePreviews = [
      RoutePreview("images/route.png", 3.2, "2022.03.23", Colors.lightGreen,
          Colors.lightGreen.shade100),
      RoutePreview("images/route.png", 0.8, "2022.03.12",
          Colors.deepOrangeAccent, Colors.orangeAccent.shade100),
      RoutePreview("images/route.png", 3.5, "2022.03.01", Colors.blue,
          Colors.lightBlue.shade100),
    ];
    return Container(
      height: 390.0,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: routePreviews.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  opaque: false,
                  transitionDuration: const Duration(milliseconds: 200),
                  reverseTransitionDuration: const Duration(milliseconds: 200),
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return Scaffold(
                      backgroundColor: Colors.black45.withOpacity(0.9),
                      body: RoutePage(),
                    );
                  },
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const _begin = Offset(1.0, 0.0);
                    const _end = Offset.zero;
                    const _curve = Curves.ease;
                    final _tween = Tween(begin: _begin, end: _end)
                        .chain(CurveTween(curve: _curve));
                    return SlideTransition(
                      position: animation.drive(_tween),
                      child: child,
                    );
                  },
                ),
              );
            },
            child: PlugInRoutePreview(
              routePreview: routePreviews[index],
            ),
          );
        },
      ),
    );
  }
}
