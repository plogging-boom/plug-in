import 'package:flutter/material.dart';
import 'package:plug_in/plug_in_route_info.dart';
import 'package:plug_in/plug_in_route_preview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  List<RoutePreview> routePreviews = [
    RoutePreview('imageUrl', 1.3, 'date', const Color(0xff31B48D),
        const Color(0xffE2FFE9)),
    RoutePreview('imageUrl', 2, 'date', const Color(0xff078BB5),
        const Color(0xffE2F8FF)),
    RoutePreview('imageUrl', 2, 'date', const Color(0xffFE5C79),
        const Color(0xffFFE2E2)),
  ];
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
          itemCount: widget.routePreviews.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return PlugInRoutePreview(
                routePreview: widget.routePreviews[index]);
          },
        ));
  }
}
