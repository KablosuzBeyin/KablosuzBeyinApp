import 'package:flutter/material.dart';
import 'package:kablosuzbeyin/screens/authenticate/Register.dart';
import 'package:kablosuzbeyin/screens/authenticate/SignIn.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    //print(showSignIn.toString());
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: showSignIn
          ? SignIn(
              toggleView: toggleView,
            )
          : Register(
              toggleView: toggleView,
            ),
    );
  }
}
