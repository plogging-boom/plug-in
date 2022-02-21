import 'package:flutter/material.dart';
import 'package:plug_in/ui/component/plug_in_container.dart';
import 'package:plug_in/ui/component/plug_in_text.dart';

class PlugInProfilePreview extends StatelessWidget {
  const PlugInProfilePreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlugInContainer(
      height: 160.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                const PlugInContainer(
                  child: Center(
                      child: PlugInText(
                    "😀",
                    fontSize: 30.0,
                  )),
                  height: 50.0,
                  width: 50.0,
                  color: Colors.white,
                  useShadow: false,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    PlugInText(
                      "Baek Dohun",
                      fontSize: 25.0,
                      color: Color(0xff205513),
                      fontWeight: FontWeight.bold,
                    ),
                    PlugInText(
                      "Republic of Korea",
                      fontSize: 12.0,
                      color: Color(0xff205513),
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const [
                      PlugInText(
                        "3.2km",
                        fontSize: 15.0,
                        color: Color(0xff205513),
                      ),
                      PlugInText(
                        "지금까지",
                        fontSize: 15.0,
                        color: Color(0xff205513),
                      )
                    ],
                  ),
                  Column(
                    children: const [
                      PlugInText(
                        "0km",
                        fontSize: 15.0,
                        color: Color(0xff205513),
                      ),
                      PlugInText(
                        "오늘",
                        fontSize: 15.0,
                        color: Color(0xff205513),
                      )
                    ],
                  ),
                  Column(
                    children: const [
                      PlugInText(
                        "100.0km",
                        fontSize: 15.0,
                        color: Color(0xff205513),
                      ),
                      PlugInText(
                        "목표",
                        fontSize: 15.0,
                        color: Color(0xff205513),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      color: const Color(0xFFABF55D),
    );
  }
}
