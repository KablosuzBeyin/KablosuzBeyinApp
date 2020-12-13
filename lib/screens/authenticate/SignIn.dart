import 'package:flutter/material.dart';
import 'package:kablosuzbeyin/authentication/AuthService.dart';
import 'package:kablosuzbeyin/screens/authenticate/Register.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 60.0),
                Image.asset(
                  "assets/images/logo.png",
                  width: 250,
                  height: 250,
                ),
                SizedBox(height: 20.0),
                Text(
                  "Kablosuz Beyin",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Lato"),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(hintText: "E-Posta"),
                  validator: (value) =>
                      value.isEmpty ? "Bir E-Posta Adresi Giriniz" : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(hintText: "Şifre"),
                  validator: (value) => value.length < 7
                      ? "7 karakterden uzun bir şifre giriniz"
                      : null,
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  child: Container(
                      width: 120,
                      height: 45,
                      child: Center(
                        child: new Text(
                          'Giriş Yap',
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.white),
                        ),
                      )),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result = _auth.signIn(email, password);
                      if (result == null) {
                        setState(() => error = "Yanlış kullanıcı adı/şifre");
                      }
                    }
                  },
                ),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Register()),
                    );
                  },
                  child: Container(
                    child: Text(
                      "Üye Ol",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                Text("Üye Olmadan devam et"),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
