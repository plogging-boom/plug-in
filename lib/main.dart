import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plug_in/ui/google_map/google_map_page.dart';
import 'package:plug_in/ui/main/main_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      initialRoute: '/google-map',
      routes: {
        "/": (BuildContext context) => MainPage(),
        "/google-map": (BuildContext context) => GoogleMapPage(),
      },
    );
  }
}
