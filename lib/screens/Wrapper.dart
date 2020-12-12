import 'package:flutter/material.dart';
import 'package:kablosuzbeyin/models/UserModel.dart';
import 'package:kablosuzbeyin/screens/authenticate/Authenticate.dart';
import 'package:kablosuzbeyin/screens/home/Home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    //Giriş ya da Anasayfayı yükle
    return user == null ? Authenticate() : Home();
  }
}
