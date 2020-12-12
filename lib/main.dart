import 'package:flutter/material.dart';
import 'package:kablosuzbeyin/createMaterialColor.dart';
import 'package:kablosuzbeyin/screens/Wrapper.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kablosuz Beyin',
        theme: ThemeData(
          primaryColor: createMaterialColor(Color(0xFFBE1E2D)),
          accentColor: createMaterialColor(Color(0xFFE7D3C8)),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Wrapper());
  }
}
