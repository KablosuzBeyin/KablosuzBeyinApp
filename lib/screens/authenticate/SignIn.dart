import 'package:flutter/material.dart';
import 'package:kablosuzbeyin/authentication/AuthService.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 3.0,
        title: Text("Giriş Yap"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: RaisedButton(
          child: Text("Giriş Yap"),
          onPressed: () async {
            dynamic result = await _auth.anonymousSignIn();
            if (result == null) {
              print("Error signing in");
            } else {
              print(result.uid);
            }
          },
        ),
      ),
    );
  }
}
