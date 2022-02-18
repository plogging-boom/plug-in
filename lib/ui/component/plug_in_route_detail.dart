import 'package:flutter/material.dart';
import 'package:plug_in/ui/component/plug_in_container.dart';
import 'package:plug_in/ui/component/plug_in_text.dart';

class PlugInRouteDetail extends StatelessWidget {
  const PlugInRouteDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: SafeArea(
          child: Column(
            children: [
              header(),
              const PlugInContainer(
                width: 350.0,
                height: 350.0,
                child: Icon(Icons.map_outlined),
                color: Colors.white,
                useShadow: false,
              ),
              const PlugInText(
                "3.85km",
                color: Colors.white,
                fontSize: 50.0,
              ),
            ],
          ),
        ),
        color: Colors.green,
      ),
    );
  }

  Padding header() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30.0,
        right: 30.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Icon(
                Icons.people,
                color: Colors.white,
                size: 50,
              ),
              PlugInText(
                "Baek Dohun",
                color: Colors.white,
              )
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 20.0,
          ),
        ],
      ),
    );
  }
}
