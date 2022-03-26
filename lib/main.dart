import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plug_in/provider/route_provider.dart';
import 'package:plug_in/provider/util_provider.dart';
import 'package:plug_in/ui/component/plug_in_appbar.dart';
import 'package:plug_in/ui/component/plug_in_bottom_navigation_bar.dart';
import 'package:plug_in/ui/member/member_page.dart';
import 'package:provider/provider.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RouteProvider()),
        ChangeNotifierProvider(create: (context) => UtilProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MemberPage(),
      ),
    );
  }
}

class PlugIn extends StatelessWidget {
  const PlugIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UtilProvider>(
      builder: (context, utilProvider, child) => Scaffold(
        appBar: PlugInAppBar(
          title: "Plug In",
        ),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: PlugInBottomNavigationBar(),
        body: SafeArea(child: utilProvider.children),
      ),
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
