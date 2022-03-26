import 'package:flutter/material.dart';
import 'package:plug_in/main.dart';
import 'package:plug_in/provider/member_provider.dart';
import 'package:plug_in/ui/component/plug_in_appbar.dart';
import 'package:plug_in/ui/component/plug_in_container.dart';
import 'package:provider/provider.dart';

class MemberView extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: PlugInAppBar(
          title: "Plug In",
          userMenu: false,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   "plog-in",
                    //   style: TextStyle(fontSize: 25, color: Colors.lightGreen),
                    // ),
                    Consumer<MemberProvider>(
                      builder: (context, value, child) => Padding(
                        padding: const EdgeInsets.only(left: 40.0, top: 100),
                        child: Text(
                          value.selectLogin ? "Login" : "Sign up",
                          style: TextStyle(
                              fontSize: 80,
                              color: Colors.lightGreen,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    // Text("＿＿＿",
                    //     style:
                    //         TextStyle(fontSize: 80, color: Colors.lightGreen)),
                  ],
                ),
              ),
              Consumer<MemberProvider>(
                builder: (context, value, child) => Stack(
                  children: <Widget>[
                    value.selectLogin ? _loginForm(size) : _signupForm(size),
                    _authButton(size),
                  ],
                ),
              ),
              Consumer<MemberProvider>(
                builder: (context, value, child) => GestureDetector(
                  onTap: () {
                    value.toggle();
                  },
                  child: Center(
                    child: Text(
                      value.selectLogin ? "Sign up now!" : "Login now!",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _authButton(Size size) => Positioned(
        left: size.width * 0.15,
        right: size.width * 0.15,
        bottom: 90,
        child: Consumer<MemberProvider>(
          builder: (context, memberProvider, child) => GestureDetector(
            onTap: () {
              memberProvider.selectLogin
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PlugIn()),
                    )
                  : memberProvider.toggle();
            },
            child: PlugInContainer(
              height: 50.0,
              color: Colors.lightGreen,
              child: Center(
                child: Text(
                  memberProvider.selectLogin ? "Login Now" : "Signup Now",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      );

  TextFormField _emailFormField() {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(
        icon: Icon(Icons.account_circle),
        labelText: "Email",
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please input correct email";
        }
        return null;
      },
    );
  }

  TextFormField _passwordFormField() {
    return TextFormField(
      obscureText: true,
      controller: _passwordController,
      decoration: InputDecoration(
        icon: Icon(Icons.vpn_key),
        labelText: "Password",
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please input correct password";
        }
        return null;
      },
    );
  }

  Widget _addressFormField() {
    return Consumer<MemberProvider>(
      builder: (context, memberProvider, child) => DropdownButtonFormField(
        decoration: InputDecoration(
          icon: Icon(Icons.home_rounded),
        ),
        value: memberProvider.selectedValue,
        items: memberProvider.valueList.map((value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (Object? value) {
          memberProvider.changeSelectValue(value.toString());
        },
      ),
    );
  }

  TextFormField _weightFormField() {
    return TextFormField(
      controller: _weightController,
      decoration: InputDecoration(
        icon: Icon(Icons.accessibility),
        labelText: "Weight",
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please input correct Weight";
        }
        return null;
      },
    );
  }

  _loginForm(Size size) {
    return Padding(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 200),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _emailFormField(),
            _passwordFormField(),
          ],
        ),
      ),
    );
  }

  _signupForm(Size size) {
    return Padding(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 200),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _emailFormField(),
            _passwordFormField(),
            _addressFormField(),
            _weightFormField(),
          ],
        ),
      ),
    );
  }
}
