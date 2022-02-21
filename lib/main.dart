import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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
      home: MainPage(),
    );
    final User? user = result.user;
    if (user == null) {
      final snackBar = SnackBar(
        content: Text("Please try again later."),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    }
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => MainPage(email: user!.email!),
    //   ),
    // );
  }
}
