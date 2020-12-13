import 'package:flutter/material.dart';
import 'package:kablosuzbeyin/authentication/AuthService.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Üye Ol",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 60.0),
                SizedBox(height: 20.0),
                Text(
                  "Toplulugumuzun bir parçası ol!",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Lato"),
                ),
                SizedBox(height: 30.0),
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
                SizedBox(height: 30.0),
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  child: Container(
                      width: 120,
                      height: 40,
                      child: Center(
                        child: new Text(
                          'Üye Ol',
                          style: new TextStyle(
                              fontSize: 18.0, color: Colors.white),
                        ),
                      )),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result = _auth.register(email, password);
                      if (result == null) {
                        setState(
                            () => error = "Lütfen Doğru Bir E-Posta Giriniz!");
                      }
                    }
                  },
                ),
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
