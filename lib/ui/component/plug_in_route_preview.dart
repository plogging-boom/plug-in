import 'package:flutter/material.dart';
import 'package:plug_in/ui/component/plug_in_container.dart';

class PlugInRoutePreview extends StatelessWidget {
  final Color backGroundColor;
  final Color middleColor;

  const PlugInRoutePreview(
      {Key? key, required this.backGroundColor, required this.middleColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      clipBehavior: Clip.none,
      children: [
        PlugInContainer(
            height: 300,
            width: 230,
            useShadow: false,
            child: const Icon(Icons.airplanemode_active),
            color: backGroundColor),
        Positioned(
          top: 250,
          child: PlugInContainer(
              height: 105,
              width: 160,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '1.3km',
                      style: TextStyle(
                          color: backGroundColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      '2022.02.13',
                      style: TextStyle(color: backGroundColor, fontSize: 15),
                    )
                  ],
                ),
              ),
              color: middleColor),
        ),
        Positioned(
          top: 330,
          child: PlugInContainer(
              height: 50,
              width: 50,
              useShadow: false,
              child: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
              ),
              color: backGroundColor),
        )
      ],
    );
  }
}
