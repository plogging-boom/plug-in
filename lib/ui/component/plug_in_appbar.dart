import 'package:flutter/material.dart';
import 'package:plug_in/ui/component/plug_in_text.dart';

class PlugInAppBar extends StatelessWidget with PreferredSizeWidget {
  String _title = "";
  Color _backgroundColor = Colors.white;
  PlugInAppBar({Key? key, String? title, Color? backgroundColor}) {
    if (title != null) {
      _title = title;
    }
    if (backgroundColor != null) {
      _backgroundColor = backgroundColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      backgroundColor: _backgroundColor,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
            size: 30.0,
          ),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
        ),
      ],
      title: PlugInText(
        _title,
        fontSize: 40.0,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
