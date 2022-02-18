import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plug_in/ui/component/plug_in_profile_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:plug_in/ui/member/member_view.dart';
import 'package:plug_in/ui/member/member_page.dart';
import 'package:plug_in/ui/route/route_page.dart';

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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Test"),
        ),
        body: Column(
          children: [
            MemberPage(),
            RoutePage(),
          ],
        ),
      ),
    );
  }
}

class Test extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Stack(
        children: [_inputForm(size), _authButton(size, context)],
      ),
    );
  }

  Widget _inputForm(Size size) => Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 12.0,
              right: 12.0,
              top: 12.0,
              bottom: 32.0,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.account_circle),
                      labelText: "Email",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please input correct email";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.vpn_key),
                      labelText: "Password",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please input correct password";
                      }
                      return null;
                    },
                  ),
                  Container(
                    height: 8,
                  ),
                  Text("Forgot Password"),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _authButton(Size size, BuildContext context) => Positioned(
        left: size.width * 0.15,
        right: size.width * 0.15,
        bottom: 0,
        child: SizedBox(
          height: 50.0,
          child: RaisedButton(
            color: Colors.blue,
            child: Text(
              "Join",
              style: const TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                print(_emailController.toString());
                _register(context);
                print(FirebaseAuth.instance.currentUser);
              }
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
          ),
        ),
      );

  void _register(BuildContext context) async {
    final UserCredential result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text)
        .catchError(
      (e) {
        print(e.toString());
      },
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
