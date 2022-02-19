import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plug_in/plug_in_container.dart';

import 'plug_in_route_detail_info.dart';

class PlugInRouteDetail extends StatelessWidget {
  final RouteDetail routeDetail;

  const PlugInRouteDetail({
    Key? key,
    required this.routeDetail,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff31B48D),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              UserInform(),
              PlugDistanceMap(
                  routeDetail.pluggingDistance, routeDetail.imageUrl),
              TimeAndKcal(routeDetail.pluggingTime, routeDetail.kcal),
              Usermemo(routeDetail.memo),
            ],
          ),
        ),
      ),
    );
  }

  Widget UserInform() {
    return Row(
      children: [
        Container(
          child: const Center(child: Text('User Image')),
          margin: const EdgeInsets.all(20.0),
          height: 70.0,
          width: 70.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: const Color(0xffffffff),
                  style: BorderStyle.solid,
                  width: 15.0)),
        ),
        const Text('User Name',
            style: TextStyle(
                color: Color(0xffffffff),
                fontSize: 20.0,
                fontWeight: FontWeight.w800)),
        IconButton(
            padding: const EdgeInsets.only(left: 150.0),
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.back,
              size: 30,
              color: Color(0xffffffff),
              textDirection: TextDirection.rtl,
            ))
        // 뒤로가기 버튼을 누르면 주원이가 만든 미리보기 페이지로 이동
      ],
    );
  }

  Widget TimeAndKcal(double time, int kcal) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Column(
        children: <Widget>[
          const Center(
              child: Text('시간',
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800))),
          Center(
              child: Text(routeDetail.pluggingDistance.toString(),
                  style: const TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800)))
        ],
      ),
      Column(
        children: <Widget>[
          const Center(
            child: Text('칼로리',
                style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800)),
          ),
          Center(
            child: Text(routeDetail.kcal.toString(),
                style: const TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800)),
          )
        ],
      )
    ]);
  }

  Widget Usermemo(String memo) {
    return Flexible(
        fit: FlexFit.loose,
        child: Stack(
          children: [
            Positioned(
                top: 20.0,
                child: PlugInContainer(
                  useShadow: false,
                  height: 150.0,
                  width: 390.0,
                  child: Center(
                    child: Text(routeDetail.memo,
                        style: const TextStyle(
                            color: Color(0xff31B48D),
                            fontSize: 20.0,
                            fontWeight: FontWeight.w800)),
                  ),
                  color: const Color(0xffffffff),
                )),
            const Positioned(
                left: 20.0,
                child: PlugInContainer(
                  useShadow: false,
                  color: Color(0xff31B48D),
                  height: 50.0,
                  width: 100.0,
                  child: Center(
                    child: Text('Memo',
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 20.0,
                            fontWeight: FontWeight.w800)),
                  ),
                ))
          ],
        ));
  }

  Widget PlugDistanceMap(double pluggingdistance, String imageurl) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 20.0),
          child: Text(
            routeDetail.pluggingDistance.toString() + 'km',
            style: const TextStyle(
                color: Color(0xffffffff),
                fontSize: 50.0,
                fontWeight: FontWeight.w800),
          ),
        ),
        PlugInContainer(
          height: 250.0,
          color: const Color(0xff0000c8),
          child: Center(child: Text(routeDetail.imageUrl)),
          useShadow: false,
        )
      ],
    );
  }
}
