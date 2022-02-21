import 'package:flutter/material.dart';
import 'package:plug_in/ui/component/plug_in_container.dart';

class TrashCanView extends StatelessWidget {
  const TrashCanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.2),
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: PlugInContainer(
          height: 500.0,
          color: Colors.green,
          child: Center(
            child: Text("쓰레기통"),
          ),
        ),
      ),
    );
  }
}
