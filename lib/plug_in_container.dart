import 'package:flutter/material.dart';

class PlugInContainer extends StatelessWidget {
  final double? width;
  final double height;
  final Widget child;
  final Color color;
  final bool useShadow;

  const PlugInContainer(
      {Key? key,
      this.width,
      required this.height,
      required this.child,
      required this.color,
      this.useShadow = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxShadow _boxShadow = useShadow
        ? BoxShadow(
            color: color,
            offset: const Offset(1.0, 4.0),
            blurRadius: 20.0,
            spreadRadius: 1.0,
          )
        : const BoxShadow(
            offset: Offset(0, 0),
          );

    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: height,
      child: child,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: color,
        boxShadow: [_boxShadow],
      ),
    );
  }
}
