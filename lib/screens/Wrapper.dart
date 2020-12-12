import 'package:flutter/material.dart';
import 'package:kablosuzbeyin/screens/authenticate/Authenticate.dart';
import 'package:kablosuzbeyin/screens/home/Home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Giriş ya da Anasayfayı yükle
    return Authenticate();
  }
}
